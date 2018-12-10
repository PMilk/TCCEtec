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
		
		$this->setRoutes($routes);
	}

	


}



?>