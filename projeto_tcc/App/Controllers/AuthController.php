<?php 

namespace App\Controllers;
use MF\Controller\Action;
use App\Connection;

class AuthController extends Action {

    public function menu() {
        $this->render('menu');
    }

}

?>
