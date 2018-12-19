<?php
namespace App\Models;
use MF\Model\Model;

class Usuario extends Model {
	private $id;
	private $nome;
	private $acesso;
	private $senha;
	private $nivel;

	public function __get($att) {
        return $this->$att;
    }

    public function __set($att,$valor) {
        $this->$att = $valor;
    }

    public function autenticar() {
        $query = "select l.ic_nivel,l.cd_usuario,u.nm_usuario from tb_login as l left join tb_usuario as u on u.cd_usuario = l.cd_usuario where l.ds_acesso = :acesso AND l.ds_senha = :senha";
        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':acesso',$this->__get('acesso'));
        $stmt->bindValue(':senha',$this->__get('senha'));
        $stmt->execute();

        $usuario = $stmt->fetch(\PDO::FETCH_ASSOC);
        if($usuario['cd_usuario'] != '' && $usuario['ic_nivel'] != '' && $usuario['nm_usuario'] !='') {
            $this->__set('id',$usuario['cd_usuario']);
            $this->__set('nivel',$usuario['ic_nivel']);
            $this->__set('nome',$usuario['nm_usuario']);
        }
        return $this;
    }

}
?>