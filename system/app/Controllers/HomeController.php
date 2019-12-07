<?php
header('Access-Control-Allow-Origin: *');
class Home extends Controllers{
	public function __construct(){
		session_start();
		if (empty($_SESSION['login'])) {
			header("Location:".base_url().'login');
		}
		//invocar para que se ejecute el metodo de la herencia
		parent::__construct();
	}
	public function home(){
		//invocar la vista con views y usamos getView y pasamos parametros esta clase y la vista
		//incluimos un arreglo que contendra toda la informacion que se enviara al home
		$data['page_tag'] = "Dashboard - Tienda Virtual";
		$data['page_title'] = "Pagina Principal";
		$data['page_name'] = "home";
		$data['page_functions'] = "function.home.js";
		$this->views->getViews($this, "home", $data);
	}

	public function setVenta(){
		$txtNombre = $_POST['txtNombre'];
		$txtCI = $_POST['txtCI'];
		$txtListTipoVehiculo = $_POST['txtListTipoVehiculo'];
		$txtLTS = $_POST['txtLTS'];
		$txtListTipoPago = $_POST['txtListTipoPago'];
		$txtFecha = $_POST['txtFecha'];
		$txtHora = $_POST['txtHora'];
		if($txtNombre == "" || $txtCI == "" || $txtLTS == "" ){
			$arrResponse = array('status'=> false,'msg' => '¡Atención debe llenar los campos.');
		}else{
			$requestInsert = $this->model->setVenta($_SESSION['userData']['user_id'],$txtNombre,$txtCI,$txtListTipoVehiculo,$txtLTS,$txtListTipoPago,$txtFecha,$txtHora);
			if($requestInsert > 0){
				$arrResponse = array('status'=> true,'msg' => '¡Venta efectuada con el numero ', 'nTicket' =>$requestInsert);
				
			}else{
				$arrResponse = array('status'=> false,'msg' => '¡Ah ocurrido un error');
			}
		}
		echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
		die();
	}
}