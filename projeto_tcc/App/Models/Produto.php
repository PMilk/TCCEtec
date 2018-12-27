<?php
namespace App\Models;
use MF\Model\Model;

class Produto extends Model {

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

}
?>