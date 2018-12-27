<?php 

namespace App\Controllers;
use MF\Controller\Action;
use App\Connection;
use MF\Model\Container;

class MenuController extends Action {
    private $cliente;
    //realiza a renderização do menu
    public function menu() {
        //verifica se está autenticado
        if($this->validaAutenticacao()) {
            //remove a sessao de cliente do cadastro de pedido
            $this->unsetSession('cliente');
            //renderiza o menu
            $this->render('menu','layout2');    
        }else {
            //mensagem de erro de login
            header('location: /?login=erro');
        }    
    }
    //realiza a renderização do cadastro de cliente
    public function cliente() {
        //verifica se está autenticado
        if($this->validaAutenticacao()) {
            //remove a sessao de cliente do cadastro de pedido
            $this->unsetSession('cliente');
            //declara a varivel como objeto da classe
            $contato = Container::getModel('contato');
            //recupera do banco de dados todos os tipos de contato
            $this->view->tipoContatos = $contato->getAllTipoContato();
            //declara a varivel como objeto da classe
            $endereco = Container::getModel('endereco');
            //recupera todos os UFS do banco de dados
            $this->view->ufs = $endereco->getAllUf();
            //recupera todas as Cidades do banco de dados
            $this->view->cidades = $endereco->getAllCidade();
            //recupera todos os Bairros do banco de dados
            $this->view->bairros = $endereco->getAllBairro();
            //renderiza o cadastro de cliente
            $this->render('cadastroCliente','layout2');    
        }else {
            //mensagem de erro de login
            header('location: /?login=erro');
        }
    }

    private function cadastrarCliente() {
        //declara a variavel como objeto da classe Cliente 
        $cliente = Container::getModel('cliente');
        //seta no objeto o tipo da pessoa
        $cliente->__set('tipo_pessoa',$_POST['tipo_pessoa']);
        //se for tipo 1 que significa pessoa física faça isso:
        if($cliente->__get('tipo_pessoa') == 1){
            //seta o nome do cliente no objeto
            $cliente->__set('nome',$_POST['nome']);
            //seta o cpf do cliente no objeto
            $cliente->__set('cpf',$_POST['cpf']);
            //seta o rg do cliente no objeto
            $cliente->__set('rg',$_POST['rg']);

        //se for do tipo 2 que significa juridica faça isso:  
        }else if($cliente->__get('tipo_pessoa') == 2){
            //seta o nome do cliente
            $cliente->__set('nome',$_POST['razao']);
            //seta o cnpj do cliente
            $cliente->__set('cnpj',$_POST['cnpj']);
            //seta a insc_estadual do cliente
            $cliente->__set('insc_estadual',$_POST['insc_estadual']);
        }else {
            //envia informando que o tipo não foi definido
            header('location: /menu/cliente?erro=tipo');
        } 
        //executa o salvamento
        if($cliente->salvar()) {
            //declara a variavel como objeto da classe contato
           $contato = Container::getModel('contato');
           //seta no objeto o id do cliente
           $contato->__set('id_cliente',$cliente->__get('id_cliente'));
           //executa uma varreura para ver quais campos foram preenchidos
           for($i = 1; $i <= 3 ; $i++) {  
            $tell = $_POST["tell".$i];
            $tipo = $_POST["tipotell".$i];
            if($tell != '' || !empty($tell)) {     
                $contato->__set('telefone',$tell);
                $contato->__set('tipo',$tipo);
                $contato->salvar();
                }
            }
            $endereco = Container::getModel('endereco');
            $endereco->__set('cep',$_POST['cep']);
            $endereco->__set('id_cliente',$cliente->__get('id_cliente'));
            $endereco->__set('bairro',$_POST['bairro']);
            $endereco->__set('logradouro',$_POST['logradouro']);
            $endereco->__set('complemento',$_POST['complemento']);
            $endereco->__set('numero',$_POST['numero']);
            $endereco->salvar();
            header('location: /menu/cliente?cad=ok');
        }

    }

    public function selecionarCliente() {
        if(!isset($this->view->clientes)) {
            $this->view->clientes = '';
        }
        $this->render('selecionarCliente','layout2');
    }

    public function selecionaCliente(){
        session_start();
        $_SESSION['cliente'] = [
            'id_cliente' => $_POST['id_cliente'],
            'tipo_cliente' => '',
        ];
        header('location: /menu/pedido');
    }


    public function pedido() {
        if(!$this->validaAutenticacao()){
            header('location: /?login=erro');
        }
        if (!isset($_SESSION['cliente'])) {
            header('location: /menu/selecionar');
        }
        //instancia pedido
        $pedido = Container::getModel('pedido');
        //instancia endereco
        $endereco = Container::getModel('endereco');
        //instancia cliente
        $cliente = Container::getModel('cliente');
        //instancia produto
        $produto = Container::getModel('produto');
        //seta no cliente o id_cliente
        $cliente->__set('id_cliente',$_SESSION['cliente']['id_cliente']);
        //puxa o ultimo codigo de pedido
        $pedido->getCod();
        $this->view->pedido = $pedido->__get('id_pedido');
        //seta os valores na view vendedor
        $this->view->vendedor = $_SESSION['nome'];
        //seta os valores do cliente na view cliente
        $this->view->cliente = $cliente->getClientePorId();
        //seta o id do cliente no objeto endereco
        $endereco->__set('id_cliente',$cliente->__get('id_cliente'));
        //seta na view enderecos os enderecos desse cliente
        $this->view->enderecos = $endereco->getEnderecos();
        //seta na view produtos os produtos
        $this->view->produtos = $produto->getAllProdutos();
        $_SESSION['cliente']['tipo_cliente'] = $cliente->__get('tipo_pessoa');
    	$this->render('cadastroPedido','layout2');
    }

    public function cadastrar() {
    	$acao = isset($_GET['acao']) ? $_GET['acao'] : '';
    	if($acao == 'cliente') {
            $this->cadastrarCliente();
    	}
    }

    public function validaAutenticacao() {
        session_start();
        if(!isset($_SESSION['id']) || $_SESSION['id'] == '' || !isset($_SESSION['nome']) || $_SESSION['nome'] == '') {
            return false;
        }else {
            return true;
        }
    }

    private function unsetSession($session){
        unset($_SESSION[$session]);
    }

    public function pesquisarClientes() {
        if(!$this->validaAutenticacao()){
            header('location: /?login=erro');
        }
        $this->cliente = Container::getModel('cliente');
        $this->cliente->__set('nome',$_GET['pesq']);
        if($this->cliente->__get('nome') == ''){
            $this->view->clientes = 'asdsa'; 
        }else{
            $this->view->clientes = $this->cliente->pesquisarClientes($_GET['tipo_pesq']);    
        }
            
        $this->selecionarCliente();
    }

     public function pagamento() {

     }
}

?>
