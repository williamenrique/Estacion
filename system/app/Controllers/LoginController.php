<?php
header('Access-Control-Allow-Origin: *');
class Login extends Controllers{
	public function __construct(){
		session_start();
		if (isset($_SESSION['login'])) {
			header("Location:".base_url().'home');
		}
		//invocar para que se ejecute el metodo de la herencia
		parent::__construct();
	}
	public function login(){
		//invocar la vista con views y usamos getViews y pasamos parametros esta clase y la vista
		//incluimos un arreglo que contendra toda la informacion que se enviara al home
		$data['page_title'] = "Login";
		$data['page_userImg'] = "usuario/default.png";
		$data['page_userNomb'] = "William Enrique";
		$data['page_userRol'] = "Administrador";
		$data['page_name'] = "login";
		$data['page_functions'] = "functionLogin.js";
		$this->views->getViews($this, "login", $data);
	}
}