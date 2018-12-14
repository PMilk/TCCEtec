<?php
namespace App\Models;
use MF\Model\Model;

class Cliente extends Model {
	private $id_cliente;
	private $nome;
	private $data_cadastro;
	private $cpf;
	private $rg;
	private $cnpj;
	private $incs_estadual;
	private $tipo_pessoa;

	public function __set($att,$valor) {
		$this->$att = $valor;

	}

	public function __get($att) {
		return $this->$att;
	}

	public function salvarRetorno() {
		$query = 'CALL cadastrarCliente(:nome)';
		$stmt = $this->db->prepare($query);
		$stmt->bindValue(':nome',trim(strtoupper($this->__get('nome'))));
		$stmt->execute();
		return $stmt->fetch(\PDO::FETCH_ASSOC);
	}

	public function salvarCliente(){
		if($this->__get('tipo_pessoa') == 1){
			$query = "CALL cadastrarClientePf(:id_cliente,:cpf,:rg)";
		}else  if($this->__get('tipo_pessoa') == 2){
			$query = "CALL cadastrarClientePj(:id_cliente,:cnpj,:insc_estadual)";	
		}
		$stmt = $this->db->prepare($query);
		$stmt->bindValue(':id_cliente',$this->__get('id_cliente'));
		if($this->__get('tipo_pessoa') == 1) {
			$stmt->bindValue(':cpf',$this->__get('cpf'));
			$stmt->bindValue(':rg',$this->__get('rg'));
			$stmt->execute();
		}else if($this->__get('tipo_pessoa') == 2) {
			$stmt->bindValue(':cnpj',$this->__get('cnpj'));
			$stmt->bindValue(':insc_estadual',$this->__get('insc_estadual'));
			$stmt->execute();
		}

		
	}
}
?>