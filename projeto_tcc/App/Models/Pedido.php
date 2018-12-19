<?php
namespace App\Models;
use MF\Model\Model;

class Pedido extends Model {
	private $id_pedido;
	private $data;
	private $hora;
	private $subtotal;
	private $desconto;
	private $observacao;


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
}
?>