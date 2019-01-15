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
        $this->validaAutenticacao();
            //remove a sessao de cliente do cadastro de pedido
        $this->unsetSession();
            //renderiza o menu
        $this->render('menu','layout2');        
    }
    //realiza a renderização do cadastro de cliente
    public function cliente() {
        //verifica se está autenticado
        $this->validaAutenticacao();
        //remove a sessao de cliente do cadastro de pedido
        $this->unsetSession();
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
        //se a view cliente for diferente de vazia
        if(isset($this->view->cliente) && $this->view->cliente != '') {
            $this->render('cadastroCliente','layout2');    
        }else {
            $this->view->cliente = '';
        }
        //renderiza o cadastro de cliente
        $this->render('cadastroCliente','layout2');    
    }

    private function cadastrarPedido() {
         $this->validaAutenticacao();
          //inicia sessao
          if(!isset($_SESSION)){
                session_start();    
          }
        //se houver um post
        if(isset($_POST)){
        	//instancia pedido
         	$pedido =  Container::getModel('pedido');
            //seta o id do usuario por meio de uma sessao
            $pedido->__set('id_usuario',$_SESSION['id']);
            //seta a data do pedido
            $pedido->__set('data',date('Y-m-d'));
            //seta a hora do pedido
            $pedido->__set('hora',date('H:i:s'));
            //seta o id do cliente 
            $pedido->__set('id_cliente',$_SESSION['cliente']['id_cliente']);
            //seta o id do endereço de entrega do cliente
            $pedido->__set('id_entrega', $_POST['id_entrega']);
           
            if($pedido->__get('id_cliente') == ''){
                header('location: /menu/pedido');
            }else {
                if(!isset($_SESSION['carrinho']) || count($_SESSION['carrinho']) == 0 ){
                    header('location: /menu/pedido?erro=cv');
                }else {
                    echo $_SESSION['cliente']['tipo_cliente'];
                    echo "<pre>";
                    print_r($_SESSION['carrinho']);
                    echo "</pre>";    
                    $pedido->salvar();
                    $produto = Container::getModel('produto');
                    $produto->__set('tipo_cliente',$_SESSION['cliente']['tipo_cliente']);
                    $total = 0;
                    foreach ($_SESSION['carrinho'] as $id_produto => $qtd) {
                        $produto->__set('id_produto',$id_produto);
                        $produto->getPreco();
                        $total += ($produto->__get('preco')*$qtd);
                    }
                    $pedido->__set('subtotal',$total);
                    foreach ($_SESSION['carrinho'] as $id_produto => $qtd) {
                        $pedido->__set('id_produto',$id_produto);
                        $pedido->__set('qtd',$qtd);
                        $pedido->salvarItemPedido();

                    }
                    unset($_SESSION['carrinho']);
                    $_SESSION['pedido']['id_pedido'] = $pedido->__get('id_pedido');
                    header('location: /menu/pedido?cad=ok');
                }
            }            
        }else {
            header('location: /menu/pedido');
        }
        
    }

    private function cadastrarCliente() {
        //remove algumas sessoes se houver
        if(!$this->validaAutenticacao()){
            header('location: /');
         }
        $this->unsetSession();
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
            $this->view->cliente = $cliente->__get('id_cliente');
            $this->cliente();
        }

    }

    public function selecionarCliente() {
        if(!$this->validaAutenticacao()){
            header('location: /?login=erro');
         }

        if(!isset($_SESSION)){
            session_start();
        }
        $this->unsetSession();
        if(!isset($this->view->clientes)) {
            $this->view->clientes = '';
        }
        $this->render('selecionarCliente','layout2');
    }

    public function selecionaCliente(){
        if(!$this->validaAutenticacao()){
            header('location: /?login=erro');
         }
        $this->unsetSession();
        if(!isset($_SESSION)){
            session_start();    
        }
        
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
        $pedido->__set('id_cliente',$cliente->__get('id_cliente'));
        $this->view->itens = $pedido->UltimosItens();
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

    public function notaEntregador() {
        if($this->validaAutenticacao()) {
            if((isset($_SESSION['pedido']['id_pedido'])) && $_SESSION['pedido']['id_pedido'] != ''){
                $pedido = Container::getModel('pedido');
                $pedido->__set('id_pedido',$_SESSION['pedido']['id_pedido']);
                $pedido->getDados();
                $cliente = Container::getModel('cliente');
                $cliente->__set('id_cliente',$pedido->__get('id_cliente'));
                $cliente->getClientePorId();
                $endereco = Container::getModel('endereco');
                $endereco->__set('id_endereco',$pedido->__get('id_pedido'));
                $endereco->getEndereco();
                $this->view->pedido = $pedido;
                $this->view->cliente = $cliente;
                $this->view->endereco = $endereco;
                $produto = Container::getModel('produto');
                $produto->__set('id_pedido',$pedido->__get('id_pedido'));
                $produto->__set('tipo_cliente',$cliente->__get('tipo_pessoa'));
                $this->view->itens = $produto->getItemProdutos();
                $this->render('NotaEntregador','layout');        
            }
            //renderiza o menu
            
        }else {
            //mensagem de erro de login
            header('location: /?login=erro');   
        }    
    }

    public function cadastrar() {
    	if(!$this->validaAutenticacao()){
            header('location: /?login=erro');
         }
        $acao = isset($_GET['acao']) ? $_GET['acao'] : '';
    	if($acao == 'cliente') {
            $this->cadastrarCliente();
    	}if($acao == 'pedido') {
            $this->cadastrarPedido();
            
        }
    }

    public function validaAutenticacao() {
        if(!isset($_SESSION)) {
            session_start();
        }
        if(!isset($_SESSION['id']) || $_SESSION['id'] == '' || !isset($_SESSION['nome']) || $_SESSION['nome'] == '') {
            header('location: /?login=erro');
        }else {
            return true;
        }
    }

    private function unsetSession(){
        if(isset($_SESSION['cliente'])){
            unset($_SESSION['cliente']);    
        }else if(isset($_SESSION['carrinho'])) {
            unset($_SESSION['carrinho']);    
        }
        
        
    }

    public function pesquisarClientes() {
       
        $cliente = Container::getModel('cliente');
        if($_GET['tipo_pesq'] == '0'){
            $cliente->__set('nome',$_GET['pesq']);
              if($cliente->__get('nome') == '') {

              }else {
                $this->view->clientes = $cliente->pesquisarClientes($_GET['tipo_pesq']);
              }

        }else if($_GET['tipo_pesq'] == '1'){
            $cliente->__set('telefone',$_GET['pesq']);    
            if($cliente->__get('telefone') == ''){
                $this->view->clientes = 'vaziu'; 
            }else{
                $this->view->clientes = $cliente->pesquisarClientes($_GET['tipo_pesq']);
            }
        }else if($_GET['tipo_pesq'] == '2'){
            $cliente->__set('cpf',$_GET['pesq']);    
            if($cliente->__get('cpf') == ''){
                $this->view->clientes = 'vaziu'; 
            }else{
                $this->view->clientes = $cliente->pesquisarClientes($_GET['tipo_pesq']);
            }
        }else if($_GET['tipo_pesq'] == '3'){
            $cliente->__set('rg',$_GET['pesq']);    
            if($cliente->__get('rg') == ''){
                $this->view->clientes = 'vaziu'; 
            }else{
                $this->view->clientes = $cliente->pesquisarClientes($_GET['tipo_pesq']);
            }
        }else if($_GET['tipo_pesq'] == '4'){
            $cliente->__set('cnpj',$_GET['pesq']);    
            if($cliente->__get('cnpj') == ''){
                $this->view->clientes = 'vaziu'; 
            }else{
                $this->view->clientes = $cliente->pesquisarClientes($_GET['tipo_pesq']);
            }
        }else if($_GET['tipo_pesq'] == '5'){
            $cliente->__set('insc_estadual',$_GET['pesq']);    
            if($cliente->__get('insc_estadual') == ''){
                $this->view->clientes = 'vaziu'; 
            }else{
                $this->view->clientes = $cliente->pesquisarClientes($_GET['tipo_pesq']);
            }
        }
        
       
            
        $this->selecionarCliente();
    }



     public function pesquisaProdutos() {
        if(!$this->validaAutenticacao()){
            header('location: /?login=erro');
        }   
        if(isset($_POST) && $_POST['id_produto'] != ''){

            $produto = Container::getModel('produto');
            $produto->__set('id_produto',$_POST['id_produto']);
            $produto->__set('tipo_cliente',$_SESSION['cliente']['tipo_cliente']);
            $produto->getPreco();
            echo $produto->__get('preco');    
        }else{
            header('location: /menu/pedido');
        }
        
        
     }

     private function gerarCarrinho() {
        if(isset($_SESSION['carrinho'])){
            $produto = Container::getModel('produto');
            $produto->__set('tipo_cliente',$_SESSION['cliente']['tipo_cliente']);
            $i = 0;
            $total = 0;
            foreach ($_SESSION['carrinho'] as $id_produto => $qtd) {
                $i ++;
                $produto->__set('id_produto',$id_produto);
                $produto->getDados();

                echo "<tr>
                        <th scope='row'>".$i."</th>
                        <td>".$produto->__get('id_produto')."</td>
                        <td>".$produto->__get('descricao')."</td>
                        <td>".$produto->__get('validade')."</td>
                        <td>R$ ".number_format($produto->__get('preco'), 2, ',', ' ')."</td>
                        <td>".$qtd."</td>
                        <td>R$ ".number_format(($qtd*$produto->__get('preco')), 2, ',', ' ')."</td>
                        <td>
                        <button class='btn btn-danger' type='button' onclick='excluir(".$produto->__get('id_produto').")'>Excluir</button></td></tr>";
                $total += ($produto->__get('preco')*$qtd);
            }
            echo "<tr>
                    <td colspan='6'>
                        <h4>Total:</h4>
                    </td>
                    <td colspan='2'>
                        <h4>R$ ".number_format($total, 2, ',', ' ')."
                    </td>
                </tr>
            ";    
        }
        
     }

     public function adicionarCarrinho() {
        if(!$this->validaAutenticacao()){
            header('location: /');
        }
        if(isset($_POST) && $_POST != ''){
            if($_POST['action'] == 'add' && $_POST['id_produto'] >= 0){
                $id_produto = (int)$_POST['id_produto'];
                $qtd = (int)$_POST['qtd'];
                if(isset($_SESSION['carrinho'][$id_produto]) ){
                    $_SESSION['carrinho'][$id_produto] += $qtd;
                }else {
                    $_SESSION['carrinho'][$id_produto] = $qtd;  
                }    
            }else if($_POST['action'] == 'render'){
                $this->gerarCarrinho();    
            }else if ($_POST['action'] == 'excluir'){
                $id_produto = (int)$_POST['id_produto'];
                unset($_SESSION['carrinho'][$id_produto]);
            }
            
            
            

        }
     }
}

?>
