<?php
header('Access-Control-Allow-Origin: *');
class Home extends Controllers{
	public function __construct(){
		// session_start();
		// if (empty($_SESSION['login'])) {
		// 	header("Location:".base_url().'home');
		// }
		//invocar para que se ejecute el metodo de la herencia
		parent::__construct();
	}
	public function home(){
		//invocar la vista con views y usamos getView y pasamos parametros esta clase y la vista
		//incluimos un arreglo que contendra toda la informacion que se enviara al home
		$data['page_tag'] = "Dashboard - Tienda Virtual";
		$data['page_title'] = "Pagina Principal";
		$data['page_name'] = "home";
		$this->views->getViews($this, "home", $data);
	}

}