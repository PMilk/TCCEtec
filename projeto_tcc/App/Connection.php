<?php

namespace App;

class Connection {

	public function getDb() {
		try {
			$conn = new \PDO(
				"mysql:host=127.0.0.1;dbname=db_mvc;charset=utf8",
				"root",
				""
			);
			return $conn;
		} catch (\PDOException $e) {
			
		}
	}
}


?>