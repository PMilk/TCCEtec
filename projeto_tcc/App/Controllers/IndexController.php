<?php 

namespace App\Controllers;
use MF\Controller\Action;
use App\Connection;

class IndexController extends Action {

    public function index() {
        $this->render('index');
    }

}

?>
