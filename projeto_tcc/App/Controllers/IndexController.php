<?php 

namespace App\Controllers;
use MF\Controller\Action;
use App\Connection;

class IndexController extends Action {

    public function index() {
    	if($this->validaAutenticacao()){
    		header('location:/menu');
    	}else {
    		$this->view->login = isset($_GET['login']) ? $_GET['login'] : ''; 
        	$this->render('index');	
    	}
    }
    public function naoEncontrado() {
        $this->render('notFount','layout'); 
    }
    
    public function validaAutenticacao() {
		session_start();
		if(!isset($_SESSION['id']) || $_SESSION['id'] == '' || !isset($_SESSION['nome']) || $_SESSION['nome'] == '' || !isset($_SESSION['nivel']) || $_SESSION['nivel'] == '') {
			return false;
		}else {
			return true;
		}
	}


}


?>
