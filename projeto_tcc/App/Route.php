<?php 

namespace App;

use MF\Init\Bootstrap;

class Route  extends Bootstrap {

	protected function initRoutes() {
		$routes['home'] = array (
			'route' => '/',
			'controller' => 'indexController',
			'action' => 'index'
		);
		$routes['usuario'] = array (
			'route' => '/menu',
			'controller' => 'MenuController',
			'action' => 'menu'
		);
		$routes['cadastroDeCliente'] = array (
			'route' => '/menu/cliente',
			'controller' => 'MenuController',
			'action' => 'cliente'
		);
		$routes['cadastroDePedido'] = array (
			'route' => '/menu/pedido',
			'controller' => 'MenuController',
			'action' => 'pedido'
		);
		$routes['cadastrar'] = array (
			'route' => '/menu/cadastrar',
			'controller' => 'MenuController',
			'action' => 'cadastrar'
		);

		$routes['autenticar'] = array (
			'route' => '/autenticar',
			'controller' => 'AuthController',
			'action' => 'autenticar'
		);
		$routes['sair'] = array (
			'route' => '/sair',
			'controller' => 'AuthController',
			'action' => 'sair'
		);
		
		
		$this->setRoutes($routes);
	}

	


}



?>