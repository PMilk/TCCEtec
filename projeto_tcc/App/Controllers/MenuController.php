<?php 

namespace App\Controllers;
use MF\Controller\Action;
use App\Connection;

class MenuController extends Action {

    public function menu() {
        $this->render('menu','layout2');
    }

    public function cliente() {
    	$this->render('cadastroCliente','layout2');
    }

}

?>
