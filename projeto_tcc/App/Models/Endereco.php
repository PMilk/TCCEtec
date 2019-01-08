<?php
namespace App\Models;
use MF\Model\Model;

class Endereco extends Model {
	private $id_endereco;
	private $cep;
	private $cidade;
	private $uf;
	private $bairro;
	private $logradouro;
	private $complemento;
	private $numero;
	private $id_cliente;

	public function __set($att,$valor) {
		if($att == 'cep') {
        	$valor = str_replace(".", "", $valor);
        	$valor = str_replace("-", "", $valor);
        	$valor = trim($valor);
		}
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

	private function verificaLogradouro() {
		if(strlen($this->__get('logradouro')) >= 3 ){
			return true;
		}else {
			return false;
		}
	}

	public function salvar() {
		if($this->verificaLogradouro()){
			$query = "CALL cadastrarLogradouro (:cep, :bairro,:logradouro,:complemento,:numero,:id_cliente)";
			$stmt = $this->db->prepare($query);
			$stmt->bindValue(':cep',$this->__get('cep'));
			$stmt->bindValue(':bairro',$this->getBairroPorNome($this->__get('bairro'))['cd_bairro']);
			$stmt->bindValue(':logradouro',$this->__get('logradouro'));
			$stmt->bindValue(':complemento',$this->__get('complemento'));
			$stmt->bindValue(':numero',$this->__get('numero'));
			$stmt->bindValue(':id_cliente',$this->__get('id_cliente'));
			$stmt->execute();	
		}else {

		}
	}

	public function getEnderecos() {
		$query = "select l.cd_logradouro, concat(l.ds_logradouro, ',', l.cd_numero,',', b.nm_bairro, ',', c.nm_cidade, '-', u.sg_uf) as endereco from tb_logradouro as l left join tb_bairro as b on b.cd_bairro = l.cd_bairro left join tb_cidade as c on c.cd_cidade = b.cd_cidade left join tb_uf as u on u.cd_uf = c.cd_uf where l.cd_cliente = :id_cliente";
		$stmt = $this->db->prepare($query);
		$stmt->bindValue(':id_cliente',$this->__get('id_cliente'));
		$stmt->execute();
		return $stmt->fetchAll(\PDO::FETCH_ASSOC);
	}

	private function getIdEndereco() {
		$query = "select cd_endereco from tb_pedido where cd_pedido = :id_endereco";
		$stmt = $this->db->prepare($query);
		$stmt->bindValue(':id_endereco',$this->__get('id_endereco'));
		$stmt->execute();
		$endereco = $stmt->fetch(\PDO::FETCH_ASSOC);
		$this->__set('id_endereco',$endereco['cd_endereco']);
		return $this;
	}
	public function getEndereco() {
		$query = "select concat(l.ds_logradouro, ',', b.nm_bairro) as ds_logradouro, c.nm_cidade, u.sg_uf, l.cd_numero, l.ds_complemento from tb_logradouro as l left join tb_bairro as b on b.cd_bairro = l.cd_bairro left join tb_cidade as c on c.cd_cidade = b.cd_cidade left join tb_uf as u on u.cd_uf = c.cd_uf where l.cd_logradouro = :id_endereco";
		$stmt = $this->db->prepare($query);
		$this->getIdEndereco();
		$stmt->bindValue(':id_endereco',$this->__get('id_endereco'));
		$stmt->execute();
		$endereco = $stmt->fetch(\PDO::FETCH_ASSOC);
		$this->__set('logradouro',$endereco['ds_logradouro']);
		$this->__set('cidade',$endereco['nm_cidade']);
		$this->__set('uf',$endereco['sg_uf']);
		$this->__set('numero',$endereco['cd_numero']);
		$this->__set('complemento',$endereco['ds_complemento']);	
		return $this;

	}
}
?>