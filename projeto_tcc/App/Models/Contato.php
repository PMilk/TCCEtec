<?php
namespace App\Models;
use MF\Model\Model;

class Contato extends Model {
	private $id_contato;
	private $telefone;
	private $tipo;
	private $id_cliente;

	public function __set($att,$valor) {
		$this->$att = $valor;

	}

	public function __get($att) {
		return $this->$att;
	}

	public function salvar() {
		$query = "CALL cadastrarContato(:id_cliente,:telefone,:tipo)";
		$stmt = $this->db->prepare($query);
		$stmt->bindValue(':id_cliente',$this->__get('id_cliente'));
		$stmt->bindValue(':telefone',$this->__get('telefone'));
		$stmt->bindValue(':tipo',$this->__get('tipo'));
		$stmt->execute();
	}

	public function getAllTipoContato() {
		$query = "select * from tipo_contato";
		$stmt = $this->db->prepare($query);
		$stmt->execute();
		return $stmt->fetchAll(\PDO::FETCH_ASSOC);
	}
}
?>