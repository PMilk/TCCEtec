<?php
namespace App\Models;
use MF\Model\Model;

class Cliente extends Model {
	private $id_cliente;
	private $nome;
	private $data_cadastro;
	private $telefone;
	private $cpf;
	private $rg;
	private $cnpj;
	private $insc_estadual;
	private $tipo_pessoa;

	public function __set($att,$valor) {
		if($att == 'nome') {
			$valor = trim($valor);
			$encoding = 'UTF-8';
			$valor = mb_convert_case($valor, MB_CASE_UPPER, $encoding);
		}else if($att == 'cpf') {
			$valor = str_replace(".", "", $valor);
			$valor = str_replace("-", "", $valor);
			$valor = trim($valor);
		}else if($att == 'rg') {
			$valor = str_replace(".", "", $valor);
			$valor = str_replace("-", "", $valor);
			$valor = trim($valor);	
		}else if($att == 'cnpj') {
			$valor = str_replace(".", "", $valor);
			$valor = str_replace("-", "", $valor);
			$valor = str_replace("/", "", $valor);
			$valor = trim($valor);
		}else if($att == 'insc_estadual') {
			$valor = str_replace(".", "", $valor);
			$valor = str_replace("-", "", $valor);
			$valor = str_replace("/", "", $valor);
			$valor = trim($valor);	
		}else if($att == 'telefone') {
			$valor = str_replace("(", "", $valor);
            $valor = str_replace(")", "", $valor);
            $valor = str_replace(" ", "", $valor);
            $valor = str_replace("-", "", $valor);
            $valor = str_replace(" ", "", $valor);
		}

		$this->$att = $valor;


	}
	public function __get($att) {
		return $this->$att;
	}

	private function verificaNome(){
		if(strlen($this->__get('nome')) >= 3){
			//se for atendido as condições pode verificar e tornar true(verificado);
			return true;
		}else {
			//senao torne como verificação com problemas.
			return false;
		}
	}

	private function pessoaFisica() {
		if($this->__get('tipo_pessoa') == 1){
			$v_cpf = true;
			$v_rg = true;
			//verifica se o cpf é vaziu
			if($this->__get('cpf') == ''){
				//se for vaziu pode verificar e tornar true(verificado);
				$v_cpf = true;
			}else {
				$query = "select count(*) as test from tipo_cliente_pf where cd_cpf = :cpf";
				$stmt = $this->db->prepare($query);
				$stmt->bindValue(':cpf',$this->__get('cpf'));
				$stmt->execute();
				$result = $stmt->fetch(\PDO::FETCH_ASSOC)['test'];
				if($result >= 1){
					$v_cpf =  false;
				}else {
					$v_cpf = true;
				}
			}
			//verifica se o rg é vaziu
			if($this->__get('rg') == ''){
				$v_rg = true;
			}else {
				$query = "select count(*) as test from tipo_cliente_pf where cd_rg = :rg";
				$stmt = $this->db->prepare($query);
				$stmt->bindValue(':rg',$this->__get('rg'));
				$stmt->execute();
				$result = $stmt->fetch(\PDO::FETCH_ASSOC)['test'];
				if($result >= 1){
					$v_rg = false;
				}else {
					$v_rg = true;
				}	
			}	
		
			if($v_rg && $v_cpf){
				return true;
			}else {
				return false;
			}
		}
	}

	private function pessoaJuridica() {
		if($this->__get('tipo_pessoa') == 2){
			$v_cnpj = true;
			$v_insc = true;
			if($this->__get('cnpj') == ''){
				//se for vaziu pode verificar e tornar true(verificado);
				$v_cnpj =  true;
			}else {
				$query = "select count(*) as test from tipo_cliente_pj where cd_cnpj = :cnpj";
				$stmt = $this->db->prepare($query);
				$stmt->bindValue(':cnpj',$this->__get('cnpj'));
				$stmt->execute();
				$result = $stmt->fetch(\PDO::FETCH_ASSOC)['test'];
				if($result >= 1){
					$v_cnpj = false;
				}else {
					$v_cnpj = true;
				}
			}
			//verifica se o rg é vaziu
			if($this->__get('insc_estadual') == ''){
				$v_insc = true;
			}else {
				$query = "select count(*) as test from tipo_cliente_pf where cd_insc_estadual = :insc_estadual";
				$stmt = $this->db->prepare($query);
				$stmt->bindValue(':insc_estadual',$this->__get('insc_estadual'));
				$stmt->execute();
				$result = $stmt->fetch(\PDO::FETCH_ASSOC)['test'];
				if($result >= 1){
					$v_insc = false;
				}else {
					$v_insc = true;
				}	
			}
			
			if($v_cnpj && $v_insc){
				return true;
			}else {
				return false;
			}
		}
	}

	private function verificarDados() {
		if($this->verificaNome()){
			if($this->__get('tipo_pessoa') == '1'){
				if($this->pessoaFisica()) {
					return true;
				}else {
					header('location:/menu/cliente?erro=ddd1');	
				}

			}else if($this->__get('tipo_pessoa') == '2'){
				if($this->pessoaJuridica()){
					return true;
				}else {
					header('location:/menu/cliente?erro=ddd2');		
				}
			}	
		}else {
			header('location: /menu/cliente?erro=nome');
		}
	}

	public function salvar() {
		if($this->verificarDados()){
			$query = 'CALL cadastrarCliente(:nome)';
			$stmt = $this->db->prepare($query);
			$stmt->bindValue(':nome',trim(strtoupper($this->__get('nome'))));
			try {
				$stmt->execute();
				$result = $stmt->fetch(\PDO::FETCH_ASSOC);	
				$this->__set('id_cliente',$result['cd_cliente']);
				if($this->__get('tipo_pessoa') == '1') {
					$query = "call cadastrarClientePf(:id_cliente,:cpf,:rg)";
					$stmt = $this->db->prepare($query);
					$stmt->bindValue(':id_cliente',$this->__get('id_cliente'));
					$stmt->bindValue(':cpf',$this->__get('cpf'));
					$stmt->bindValue(':rg',$this->__get('rg'));
				}else 
					if($this->__get('tipo_pessoa') == '2') {
						$query = "CALL cadastrarClientePj(:id_cliente,:cnpj,:insc_estadual)";	
						$stmt = $this->db->prepare($query);
						$stmt->bindValue(':id_cliente',$this->__get('id_cliente'));
						$stmt->bindValue(':cnpj',$this->__get('cnpj'));
						$stmt->bindValue(':insc_estadual',$this->__get('insc_estadual'));			
					}	
				try {
					$stmt->execute();
					return true;
				} catch (\PDOException $e) {
					echo 'ERRO:'.$e->getMessage();
				}
	
			} catch (\PDOException $e) {
				echo 'ERRO:'.$e->getMessage();
			}
						
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
			$query = "select '1' as tipo,c.nm_cliente as nome,pf.cd_cpf as cpf,pf.cd_rg as rg from tb_cliente as c left join tipo_cliente_pf as pf on c.cd_cliente = pf.cd_cliente where c.cd_cliente = :id_cliente";
		}else {
			$query = "select '2' as tipo,c.nm_cliente as nome,pj.cd_cnpj as cnpj,pj.cd_insc_estadual as insc from tb_cliente as c left join tipo_cliente_pj as pj on c.cd_cliente = pj.cd_cliente where c.cd_cliente = :id_cliente";
		}
		$stmt = $this->db->prepare($query);
		$stmt->bindValue(':id_cliente',$this->__get('id_cliente'));
		$stmt->execute();
		$result = $stmt->fetch(\PDO::FETCH_ASSOC);
		$this->__set('nome',$result['nome']);
		$this->__set('tipo_pessoa',$result['tipo']);
		if($this->__get('tipo_pessoa') == '1'){
			$this->__set('cpf',$result['cpf']);
			$this->__set('rg',$result['rg']); 	
		}else if($this->__get('tipo_pessoa') == '2'){
			$this->__set('cpf',$result['cnpj']);
			$this->__set('insc_estadual',$result['insc']); 	
		}
		$this->getTelefone();
		return $this;
		
	}
	private function getTelefone() {
		$query = "select cd_telefone from tb_contato where cd_cliente = :id_cliente";
		$stmt = $this->db->prepare($query);
		$stmt->bindValue(':id_cliente',$this->__get('id_cliente'));
		$stmt->execute();
		$valor = $stmt->fetchAll(\PDO::FETCH_ASSOC);
		if(count($valor) == 0){
			$this->__set('telefone','');
		}else {	
			$telefone = $valor[0];
			$this->__set('telefone',$telefone['cd_telefone']);	
		}
		return $this;
	}
	public function pesquisarClientes($tipo) {
		
		if($tipo == 0) {
			//nome
			$query = "select '1' as tipo,c.cd_cliente,c.nm_cliente as nome, c.dt_cadastro as data, pf.cd_cpf as cod,pf.cd_rg as cod2,c.cd_cliente as id_cliente, co.cd_telefone as telefone from tipo_cliente_pf as pf left join tb_cliente as c on c.cd_cliente = pf.cd_cliente left join tb_contato as co on co.cd_contato = (SELECT max(co.cd_contato) FROM tb_contato as co where co.cd_cliente = c.cd_cliente) where c.nm_cliente like :nome_pesq
UNION 
select '2' as tipo,c.cd_cliente,c.nm_cliente, c.dt_cadastro, pj.cd_cnpj,pj.cd_insc_estadual,c.cd_cliente, co.cd_telefone as telefone from tipo_cliente_pj as pj left join tb_cliente as c on c.cd_cliente = pj.cd_cliente left join tb_contato as co on co.cd_contato = (SELECT max(co.cd_contato) FROM tb_contato as co where co.cd_cliente = c.cd_cliente) where c.nm_cliente like :nome_pesq";
			$stmt = $this->db->prepare($query);
			$stmt->bindValue(':nome_pesq',$this->__get('nome')."%");
		} else if($tipo == 1) {
			$query = "
select '1' as tipo,c.cd_cliente,c.nm_cliente as nome, c.dt_cadastro as data, pf.cd_cpf as cod,pf.cd_rg as cod2,c.cd_cliente as id_cliente, co.cd_telefone as telefone from tipo_cliente_pf as pf left join tb_cliente as c on c.cd_cliente = pf.cd_cliente left join tb_contato as co on co.cd_cliente = c.cd_cliente where co.cd_telefone like :tell_pesq group by(c.cd_cliente)
UNION 
select '2' as tipo,c.cd_cliente,c.nm_cliente, c.dt_cadastro, pj.cd_cnpj,pj.cd_insc_estadual,c.cd_cliente, co.cd_telefone as telefone from tipo_cliente_pj as pj left join tb_cliente as c on c.cd_cliente = pj.cd_cliente left join tb_contato as co on co.cd_cliente = c.cd_cliente  where co.cd_telefone like :tell_pesq group by(c.cd_cliente)";
			$stmt = $this->db->prepare($query);
			$stmt->bindValue(':tell_pesq',$this->__get('telefone')."%");	
			//telefone
		} else if($tipo == 2) {
			//cpf
			$query = "select '1' as tipo,c.cd_cliente,c.nm_cliente as nome, c.dt_cadastro as data, pf.cd_cpf as cod,pf.cd_rg as cod2,c.cd_cliente as id_cliente, co.cd_telefone as telefone from tipo_cliente_pf as pf left join tb_cliente as c on c.cd_cliente = pf.cd_cliente left join tb_contato as co on co.cd_contato = (SELECT max(co.cd_contato) FROM tb_contato as co where co.cd_cliente = c.cd_cliente) where pf.cd_cpf like :nome_pesq";
			$stmt = $this->db->prepare($query);
			$stmt->bindValue(':nome_pesq',$this->__get('cpf')."%");
		} else if($tipo == 3) {
			//rg
			//cpf
			$query = "select '1' as tipo,c.cd_cliente,c.nm_cliente as nome, c.dt_cadastro as data, pf.cd_cpf as cod,pf.cd_rg as cod2,c.cd_cliente as id_cliente, co.cd_telefone as telefone from tipo_cliente_pf as pf left join tb_cliente as c on c.cd_cliente = pf.cd_cliente left join tb_contato as co on co.cd_contato = (SELECT max(co.cd_contato) FROM tb_contato as co where co.cd_cliente = c.cd_cliente) where pf.cd_rg like :nome_pesq";
			$stmt = $this->db->prepare($query);
			$stmt->bindValue(':nome_pesq',$this->__get('rg')."%");
		} else if($tipo == 4) {
			//cnpj
			$query = "select '2' as tipo,c.cd_cliente,c.nm_cliente as nome, c.dt_cadastro as data, pj.cd_cnpj as cod,pj.cd_insc_estadual as cod2,c.cd_cliente, co.cd_telefone as telefone from tipo_cliente_pj as pj left join tb_cliente as c on c.cd_cliente = pj.cd_cliente left join tb_contato as co on co.cd_contato = (SELECT max(co.cd_contato) FROM tb_contato as co where co.cd_cliente = c.cd_cliente) where pj.cd_cnpj like :nome_pesq";
			$stmt = $this->db->prepare($query);
			$stmt->bindValue(':nome_pesq',$this->__get('cnpj')."%");
		} else if($tipo == 5) {
			//insc
			$query = "select '2' as tipo,c.cd_cliente,c.nm_cliente as nome, c.dt_cadastro as data, pj.cd_cnpj as cod,pj.cd_insc_estadual as cod2,c.cd_cliente, co.cd_telefone as telefone from tipo_cliente_pj as pj left join tb_cliente as c on c.cd_cliente = pj.cd_cliente left join tb_contato as co on co.cd_contato = (SELECT max(co.cd_contato) FROM tb_contato as co where co.cd_cliente = c.cd_cliente) where pj.cd_insc_estadual like :nome_pesq";
			$stmt = $this->db->prepare($query);
			$stmt->bindValue(':nome_pesq',$this->__get('insc_estadual')."%");
		}
		$stmt->execute();
		return $stmt->fetchAll(\PDO::FETCH_ASSOC);
	}
}
?>