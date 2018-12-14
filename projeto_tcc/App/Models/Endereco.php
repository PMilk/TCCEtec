<?php
namespace App\Models;
use MF\Model\Model;

class Endereco extends Model {
	private $id_endereco;
	private $cep;
	private $bairro;
	private $logradouro;
	private $complemento;
	private $numero;
	private $id_cliente;

	public function __set($att,$valor) {
		$this->$att = $valor;

	}

	public function __get($att) {
		return $this->$att;
	}

	public function getAllUf() {
		$query = "select * from tb_uf";
		$stmt = $this->db->prepare($query);
		$stmt->execute();
		return $stmt->fetchAll(\PDO::FETCH_ASSOC);
	}

	public function getAllCidade() {
		$query = "select cd_cidade,nm_cidade from tb_cidade";
		$stmt = $this->db->prepare($query);
		$stmt->execute();
		return $stmt->fetchAll(\PDO::FETCH_ASSOC);
	}

	public function getAllBairro() {
		$query = "select cd_bairro,nm_bairro from tb_bairro";
		$stmt = $this->db->prepare($query);
		$stmt->execute();
		return $stmt->fetchAll(\PDO::FETCH_ASSOC);
	}

	public function getBairroPorNome() {
		$query = "select * from tb_bairro where nm_bairro = :bairro";
		$stmt = $this->db->prepare($query);
		$stmt->bindValue(':bairro',$this->__get('bairro'));
		$stmt->execute();
		return $stmt->fetch(\PDO::FETCH_ASSOC);
	}

	public function salvar() {
		$query = "CALL cadastrarLogradouro (:cep, :bairro,:logradouro,:complemento,:numero,:id_cliente)";
		$stmt = $this->db->prepare($query);
		$stmt->bindValue(':cep',$this->__get('cep'));
		$stmt->bindValue(':bairro',$this->getBairroPorNome($this->__get('bairro'))['cd_bairro']);
		$stmt->bindValue(':logradouro',$this->__get('logradouro'));
		$stmt->bindValue(':complemento',$this->__get('complemento'));
		$stmt->bindValue(':numero',$this->__get('numero'));
		$stmt->bindValue(':id_cliente',$this->__get('id_cliente'));
		$stmt->execute();
	}
	
}
?>