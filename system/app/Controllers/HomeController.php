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
		$txtMonto = $_POST['txtMonto'];
		if($txtNombre == "" || $txtCI == "" || $txtLTS == "" || $txtListTipoVehiculo == 0 || $txtListTipoPago == 0 || $txtMonto == ""){
			$arrResponse = array('status'=> false,'msg' => '¡Atención debe llenar los campos.');
		}else{
			$requestInsert = $this->model->setVenta($_SESSION['userData']['user_id'],$txtNombre,$txtCI,$txtListTipoVehiculo,$txtLTS,$txtListTipoPago,$txtFecha,$txtHora,$txtMonto);
			if($requestInsert > 0){
				$arrResponse = array('status'=> true,'msg' => '¡Venta efectuada con el numero '.$requestInsert, 'nTicket' =>$requestInsert);
				
			}else{
				$arrResponse = array('status'=> false,'msg' => '¡Ah ocurrido un error');
			}
		}
		echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
		die();
	}
	//obtener ultimos tickets del dia
	public function getLastTicket(){
		$arrData = $this->model->getLastTicket($_SESSION['userData']['user_id'],date('d-m-y'));
		$html = '';

			for ($i=0; $i < count($arrData); $i++) {
				$arrData[$i]['ticket'] = '
					<a href="#" class="" onclick="fntTicket('.$arrData[$i]['id_ticket_venta'].')"><span class="text-bold">N° '.$arrData[$i]['id_ticket_venta'].'</span>   '.$arrData[$i]['fecha_ticket'].' - '.$arrData[$i]['hora_ticket'].'</a><br>
				';
				// $arrData[$i]['id_ticket'] = '
				// 	<a href="#" class="" onclick="fntTicket('.$arrData[$i]['id_ticket_venta'].')"><span class="text-bold">N° '.$arrData[$i]['id_ticket_venta'].'
				// ';
			}
			echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
			die();
		
	}
	// obtener un ticket
	public function getTicket(int $intIdTicket){
		$arrData = $this->model->getTicket($intIdTicket);
		echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
		die();
	}
	// actualizar tasa
	public function updateTasa(float $intTasa){
		$requestUpdate = $this->model->updateTasa($intTasa);
		if($requestUpdate > 0){
			$arrResponse = array("status" => true, "msg" => "Tasa actualizada");
		}else{
			$arrResponse = array("status" => false, "msg" => "No es posible actualizar");
		}
		echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
		die();
	}
	// obtener tasa
	public function getTasa(){
		$requestUpdate = $this->model->getTasa();
		echo json_encode($requestUpdate,JSON_UNESCAPED_UNICODE);
		die();
	}
	// obtener detalle
	public function getDetail(){
		$htmlOptions = "";
		$arrData = $this->model->getDetail();
		$arrDataP = $this->model->getDetailP();
		$htmlOptions .= '<strong>Vehiculos</strong>';
		for ($i=0; $i < count($arrData); $i++) {
			$tipo = $arrData[$i]['tipo_vehiculo_ticket'] == 1 ?	'Carro' : ($arrData[$i]['tipo_vehiculo_ticket'] == 2 ? 'Moto' : 'Camion');
			$htmlOptions .= '<li>'.$arrData[$i]['cant_vehiculo']. ' '.$tipo.' </li>';
		}
		$htmlOptions .= '<strong>Montos</strong>';
		for ($j=0; $j < count($arrDataP); $j++) {
			// echo round($arrDataP[$j]['cant_venta'],2);
			// die();
			$tipoP = $arrDataP[$j]['tipo_pago_ticket'] == 1 ?	'Divisa '.$arrDataP[$j]['cant_venta'] : ($arrDataP[$j]['tipo_pago_ticket'] == 2 ?	'Efectivo ' . round($arrDataP[$j]['cant_venta'],2).'Bs' : 'Punto de venta '.round($arrDataP[j]['cant_venta'],2).'Bs');
			$htmlOptions .= '<li>'.$arrDataP[$j]['cant_tipo_pago']. ' '.$tipoP.' </li>';
		}
		echo $htmlOptions;
		die();
	}
	public function getDetailP(){
		$requestDetail = $this->model->getDetailP();
		echo json_encode($requestDetail,JSON_UNESCAPED_UNICODE);
		die();
	}
}