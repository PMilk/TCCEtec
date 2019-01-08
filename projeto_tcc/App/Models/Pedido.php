<?php
namespace App\Models;
use MF\Model\Model;

class Pedido extends Model {
	private $id_pedido;
	private $data;
	private $hora;
	private $id_entrega;
	private $id_usuario;
	private $id_cliente;
	private $subtotal;
	private $desconto;
	private $observacao;
	private $id_produto;
	private $qtd;


	public function __set($att,$valor) {
		$this->$att = $valor;

	}

	public function __get($att) {
		return $this->$att;
	}

	public function ContarPedidos() {
		$query = "select count(*) as total from tb_pedido";
		$stmt = $this->db->prepare($query);
		$stmt->execute();
		$result = $stmt->fetch(\PDO::FETCH_ASSOC)['total'];
		return $result;
	}
	
	public function getCod() {
		$quantidade = $this->ContarPedidos();
		if($quantidade >=1){
			$query = "select max(cd_pedido)+1 as cod from tb_pedido";
			$stmt = $this->db->prepare($query);
			$stmt->execute();
			$cod = $stmt->fetch(\PDO::FETCH_ASSOC)['cod'];
			$this->__set('id_pedido',$cod);
			return $this;
		}else {
			$this->__set('id_pedido',($quantidade +1));
			return $this;
		}
	}

	public function UltimosItens() {
        $query = "select pd.dt_pedido,pd.hr_pedido,concat(p.ds_produto, ',',p.qt_litros, 'L,', m.nm_marca) as ds_produto, DATE_FORMAT(p.dt_validade, '%m/%Y') as dt_validade, ip.cd_pedido from item_pedido as ip left join tb_produto as p on p.cd_produto = ip.cd_produto left join tb_marca as m on m.cd_marca = p.cd_marca left join tb_pedido as pd on pd.cd_pedido = ip.cd_pedido where ip.cd_pedido = (select max(pd.cd_pedido) from tb_pedido as pd where cd_cliente = :id_cliente)";
        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':id_cliente',$this->__get('id_cliente'));
        $stmt->execute();
        return $stmt->fetchAll(\PDO::FETCH_ASSOC);

    }

    public function getDados() {
    	$query = "select pd.cd_entrega, pd.cd_pedido, pd.dt_pedido,pd.hr_pedido, pd.cd_cliente from tb_pedido as pd where pd.cd_pedido = :id_pedido";
    	$stmt = $this->db->prepare($query);
    	$stmt->bindValue(':id_pedido',$this->__get('id_pedido'));
    	$stmt->execute();
    	$pedido = $stmt->fetch(\PDO::FETCH_ASSOC);
    	$this->__set('data',$pedido['dt_pedido']);
    	$this->__set('hora',$pedido['hr_pedido']);
    	$this->__set('id_cliente',$pedido['cd_cliente']);
    	$this->__set('id_entrega',$pedido['cd_entrega']);
    	return $this;

    }

	public function salvar() {
		$query = "insert into tb_pedido(cd_pedido,dt_pedido,hr_pedido,cd_endereco,cd_funcionario,cd_cliente) select max(cd_pedido)+1,:data,:hora,:id_entrega,:id_usuario,:id_cliente from tb_pedido";
		$conn = $this->db;
		$stmt = $conn->prepare($query);
		$stmt->bindValue(':data',$this->__get('data'));
		$stmt->bindValue(':hora',$this->__get('hora'));
		$stmt->bindValue(':id_entrega',$this->__get('id_entrega'));
		$stmt->bindValue(':id_usuario',$this->__get('id_usuario'));
		$stmt->bindValue(':id_cliente',$this->__get('id_cliente'));	
		try {
				$stmt->execute();
				$query ="select max(cd_pedido) as cd_pedido from tb_pedido";
				$stmt = $conn->prepare($query);
				try {
					$stmt->execute();	
					$id = $stmt->fetch(\PDO::FETCH_ASSOC)['cd_pedido'];
					$this->__set('id_pedido',$id);
					return $this;
				} catch (PDOException $e) {
					echo "ERRO:".$e->getMessage();
				}

			} catch (PDOException $e) {
				echo "ERRO:".$e->getMessage();
			}	
	}

	public function salvarItemPedido(){
        $query = "insert into item_pedido(cd_pedido,cd_produto,qt_produto) value(:id_pedido,:id_produto,:qtd)";
        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':id_pedido',$this->__get('id_pedido'));
        $stmt->bindValue(':id_produto',$this->__get('id_produto'));
        $stmt->bindValue(':qtd',$this->__get('qtd'));
        $stmt->execute();
        $query = "UPDATE tb_pedido SET vl_subtotal = :total WHERE cd_pedido = :id_pedido";
        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':total',$this->__get('subtotal'));
        $stmt->bindValue(':id_pedido',$this->__get('id_pedido'));
        $stmt->execute();
    }
}
?>