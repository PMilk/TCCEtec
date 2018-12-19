<?php

	namespace App\Controllers;
	use MF\Controller\Action;
	use MF\Model\Container;

	class AuthController extends Action {
		public function autenticar() {
			$usuario = Container::getModel('usuario');

			$usuario->__set('acesso',$_POST['acesso']);
			$usuario->__set('senha',$_POST['senha']);
			$usuario->autenticar();
			if($usuario->__get('id') != '' && $usuario->__get('acesso') != '') {
				session_start();
				$_SESSION['id'] = $usuario->__get('id');
				$_SESSION['nome'] = $usuario->__get('nome');
				$_SESSION['nivel'] = $usuario->__get('nivel');
				header('location: /menu');
			}else {
				header('location: /?login=erro');
				echo "Não Autenticado";
			}
		}
		public function sair() {
			session_start();
			session_destroy();
			header('location: /');
		}
	}


?>