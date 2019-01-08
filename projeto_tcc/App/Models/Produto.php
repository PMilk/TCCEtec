<?php
namespace App\Models;
use MF\Model\Model;

class Produto extends Model {
    private $id_pedido;
    private $qtd;
    private $id_produto;
    private $descricao;
    private $validade;
    private $tipo_cliente;
    private $preco;

	public function __get($att) {
        return $this->$att;
    }

    public function __set($att,$valor) {
        $this->$att = $valor;
    }

    public function getAllProdutos() {
        $query = "select p.cd_produto, concat(p.ds_produto, ',',p.qt_litros, 'L,', m.nm_marca, ' - ', DATE_FORMAT(p.dt_validade, '%m/%Y')) as ds_produto from tb_produto as p left join tb_marca as m on m.cd_marca = p.cd_marca";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }

    public function getProdutosPorNome() {
        $query = "select p.cd_produto, concat(p.ds_produto, ',',p.qt_litros, 'L,', m.nm_marca, ' - ', DATE_FORMAT(p.dt_validade, '%m/%Y')) as ds_produto from tb_produto as p left join tb_marca as m on m.cd_marca = p.cd_marca where concat(p.ds_produto, ',',p.qt_litros, 'L,', m.nm_marca, ' - ', DATE_FORMAT(p.dt_validade, '%m/%Y')) like :pesq ";
        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':pesq','%'.$this->__get('descricao').'%');
        $stmt->execute();
        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }

    public function getDados() {
        $query = "select concat(p.ds_produto, ',',p.qt_litros, 'L,', m.nm_marca) as ds_produto, DATE_FORMAT(p.dt_validade, '%m/%Y') as dt_validade from tb_produto as p left join tb_marca as m on m.cd_marca = p.cd_marca where cd_produto = :id_produto";
        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':id_produto',$this->__get('id_produto'));
        $stmt->execute();
        $stmt = $stmt->fetch(\PDO::FETCH_ASSOC);
        $this->__set('descricao',$stmt['ds_produto']);
        $this->__set('validade',$stmt['dt_validade']);
        $this->getPreco();
        return $this;
    }


    public function getPreco() {
        if($this->__get('tipo_cliente') == '1'){
            $query = "select vl_pf as valor from tb_produto where cd_produto = :id_produto";
        }else {
            $query = "select vl_pj as valor from tb_produto where cd_produto = :id_produto";
        }
        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':id_produto',$this->__get('id_produto'));
        $stmt->execute();
        $this->__set('preco',$stmt->fetch(\PDO::FETCH_ASSOC)['valor']);
        return $this;
    }

    public function getItemProdutos(){
        if($this->__get('tipo_cliente') == '1') {
            $query = "select concat(p.ds_produto, ',',p.qt_litros, 'L,', m.nm_marca, ' - ', DATE_FORMAT(p.dt_validade, '%m/%Y')) as ds_produto, p.vl_pf as valor,ip.qt_produto  from item_pedido as ip left join tb_produto as p on p.cd_produto = ip.cd_produto left join tb_marca as m on m.cd_marca = p.cd_marca where ip.cd_pedido = :id_pedido";
        }else {
            $query = "select concat(p.ds_produto, ',',p.qt_litros, 'L,', m.nm_marca, ' - ', DATE_FORMAT(p.dt_validade, '%m/%Y')) as ds_produto, p.vl_pj as valor,ip.qt_produto  from item_pedido as ip left join tb_produto as p on p.cd_produto = ip.cd_produto left join tb_marca as m on m.cd_marca = p.cd_marca where ip.cd_pedido = :id_pedido";
        }
        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':id_pedido',$this->__get('id_pedido'));
        $stmt->execute();
        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }

    
}
?>