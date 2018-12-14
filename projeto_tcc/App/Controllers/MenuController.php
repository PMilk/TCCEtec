<?php 

namespace App\Controllers;
use MF\Controller\Action;
use App\Connection;
use MF\Model\Container;

class MenuController extends Action {
    private $cliente;

    public function menu() {
        $this->render('menu','layout2');
    }

    public function cliente() {
    	$contato = Container::getModel('contato');
    	$this->view->tipoContatos = $contato->getAllTipoContato();
        $endereco = Container::getModel('endereco');
        $this->view->ufs = $endereco->getAllUf();
        $this->view->cidades = $endereco->getAllCidade();
        $this->view->bairros = $endereco->getAllBairro();
    	$this->render('cadastroCliente','layout2');
    }

    public function pedido() {
    	$this->render('cadastroPedido','layout2');
    }

    private function cadastrarCliente() {
        $this->cliente = Container::getModel('cliente');
        $this->cliente->__set('tipo_pessoa',$_POST['tipo_pessoa']);
       
        if($this->cliente->__get('tipo_pessoa') == 1){
            $this->cliente->__set('nome',$_POST['nome']);
        }else if($this->cliente->__get('tipo_pessoa') == 2){
            $this->cliente->__set('nome',$_POST['razao']);
        }else {
            header('location: /menu/cliente?erro=nome');
        } 
        if($this->cliente->__get('nome') == '' || strlen($this->cliente->__get('nome')) <= 3){
            header('location: /menu/cliente?erro=nome');
        }else {
            $id_cliente = $this->cliente->salvarRetorno();
            $this->cliente->__set('id_cliente',$id_cliente['cd_cliente']);
        }
    }

    private function cadastrarTipo() {
        if($this->cliente->__get('tipo_pessoa') == 1){
            $this->cliente->__set('cpf',$_POST['cpf']);
            $this->cliente->__set('rg',$_POST['rg']);
            $this->cliente->salvarCliente();
        }else{
            $this->cliente->__set('nome',$_POST['razao']);     
            $this->cliente->__set('cnpj',$_POST['cnpj']);
            $this->cliente->__set('insc_estadual',$_POST['insc_estadual']);
            $this->cliente->salvarCliente();
        }    
    }

    private function cadastrarContato() {
        $contato = Container::getModel('contato');
        $contato->__set('id_cliente',$this->cliente->__get('id_cliente'));
        for($i = 1; $i <= 3 ; $i++) {
            $tell = "tell".$i;
            $tipo = "tipotell".$i;
            $tell = $_POST[$tell];
            $tell = str_replace("(", "", $tell);
            $tell = str_replace(")", "", $tell);
            $tell = str_replace(" ", "", $tell);
            $tell = str_replace("-", "", $tell);
            $tipo = $_POST[$tipo];
            if($tell == '' || empty($tell)) {     
            }else {
                    $contato->__set('telefone',$tell);
                    $contato->__set('tipo',$tipo);
                    $contato->salvar();
            }
        }    
    }

    private function cadastrarEndereco() {
        $endereco = Container::getModel('endereco');
        $cep = trim($_POST['cep']);
        $cep = str_replace(".", "", $cep);
        $cep = str_replace("-", "", $cep);
        $endereco->__set('cep',$cep);
        $endereco->__set('id_cliente',$this->cliente->__get('id_cliente'));
        $endereco->__set('bairro',$_POST['bairro']);
        $endereco->__set('logradouro',$_POST['logradouro']);
        $endereco->__set('complemento',$_POST['complemento']);
        $endereco->__set('numero',$_POST['numero']);
        if($endereco->__get('logradouro') != ''){
            $endereco->salvar();    
        }
        
            
    }

    public function cadastrar() {
    	$acao = isset($_GET['acao']) ? $_GET['acao'] : '';
    	if($acao == 'cliente') {
            $this->cadastrarCliente();
            $this->cadastrarTipo();
            $this->cadastrarContato();			
    		$this->cadastrarEndereco();	
    		header('location: /menu/cliente?cad=ok');
    		
    	}
    }

}

?>
