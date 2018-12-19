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

	public function verificarTipoPessoa() {
		$query = "select count(*) as pf from tipo_cliente_pf where cd_cliente = :id_cliente";
		$stmt = $this->db->prepare($query);
		$stmt->bindValue(':id_cliente',$this->__get('id_cliente'));
		$stmt->execute();
		$result = $stmt->fetch(\PDO::FETCH_ASSOC)['pf'];
		if($result == 1){
			return true;
		}else {
			return false;
		}
	}

	public function getClientePorId() {
		if($this->verificarTipoPessoa()) {
			$query = "select c.nm_cliente as nome,pf.cd_cpf as cod1,pf.cd_rg as cod2 from tb_cliente as c left join tipo_cliente_pf as pf on c.cd_cliente = pf.cd_cliente where c.cd_cliente = :id_cliente";
		}else {
			$query = "select c.nm_cliente as nome,pj.cd_cnpj as cod1,pj.cd_insc_estadual as cod2 from tb_cliente as c left join tipo_cliente_pj as pj on c.cd_cliente = pj.cd_cliente where c.cd_cliente = :id_cliente";
		}
		$stmt = $this->db->prepare($query);
		$stmt->bindValue(':id_cliente',$this->__get('id_cliente'));
		$stmt->execute();
		return $stmt->fetch(\PDO::FETCH_ASSOC);
	}
	public function pesquisarClientes($tipo) {
		
		if($tipo == 0) {
			//nome
			$query = "select '1' as tipo,c.nm_cliente as nome, c.dt_cadastro as data, pf.cd_cpf as cod,pf.cd_rg as cod2,c.cd_cliente as id_cliente from tipo_cliente_pf as pf left join tb_cliente as c on c.cd_cliente = pf.cd_cliente where c.nm_cliente like :nome_pesq UNION select '2' as tipo,c.nm_cliente, c.dt_cadastro, pj.cd_cnpj,pj.cd_insc_estadual,c.cd_cliente from tipo_cliente_pj as pj left join tb_cliente as c on c.cd_cliente = pj.cd_cliente where c.nm_cliente like :nome_pesq";
			$stmt = $this->db->prepare($query);
			$stmt->bindValue(':nome_pesq',$this->__get('nome')."%");
		} else if($tipo == 1) {	
			//telefone
		} else if($tipo == 2) {
			//cpf
		} else if($tipo == 3) {
			//rg
		} else if($tipo == 4) {
			//cnpj
		} else if($tipo == 5) {
			//insc
		}
		$stmt->execute();
		return $stmt->fetchAll(\PDO::FETCH_ASSOC);
	}
}
?>