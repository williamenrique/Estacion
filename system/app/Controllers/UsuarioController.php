<?php
header('Access-Control-Allow-Origin: *');
class Usuario extends Controllers{
	public function __construct(){
		session_start();
		if (empty($_SESSION['login'])) {
			header("Location:".base_url().'login');
		}
		//invocar para que se ejecute el metodo de la herencia
		parent::__construct();
	}
	public function createuser(){
		//invocar la vista con views y usamos getView y pasamos parametros esta clase y la vista
		//incluimos un arreglo que contendra toda la informacion que se enviara al home
		$data['page_tag'] = "Dashboard - Tienda Virtual";
		$data['page_title'] = "Pagina Principal";
		$data['page_name'] = "home";
		$data['page_functions'] = "function.user.js";
		$this->views->getViews($this, "createuser", $data);
	}

	public function setUser(){
		if($_POST){
			// $idUser = intval($_POST['idUsuario']);
			$intIdentificacion = intval(strClean($_POST['txtIdentificacion']));
			$strTxtNombre = ucwords(strClean($_POST['txtNombres']));//convierte las primeras letras en mayusculas
			$strtxtApellidos = ucwords(strClean($_POST['txtApellidos']));//convierte las primeras letras en mayusculas
			$intTxtTlf = intval(strClean($_POST['txtTlf']));
			$strTxtEmail = strtolower($_POST['txtEmail']);//convierte todas las letras en minusculas
			$intListStatus = intval($_POST['listStatus']);
			$intlistRolId = intval($_POST['listRolId']);
			if(empty($_POST['txtIdentificacion']) || empty($_POST['txtNombres'] )|| empty($_POST['txtApellidos'] ) ||
				empty($_POST['txtTlf']) || empty($_POST['txtEmail']) || empty($_POST['listStatus']) || empty($_POST['listRolId'])) {
				$arrResponse = array("status" => false, "msg" => "Debe llenar los campos");
			}else{
				// campos llenos proseguimos
				$strTxtPass = encryption(123456);
				//al generar el pass se envia al modelo
				$requestUser = $this->model->insertUser($intIdentificacion, $strTxtNombre, $strtxtApellidos, $intTxtTlf, $strTxtEmail,
				$intListStatus, $intlistRolId, $strTxtPass);
				// evaluamos si ya existe
				if($requestUser == 0){
					$arrResponse = array("status" => false, "msg" => "Usuario existente");
				}else{
					//relacionar un usuario con los roles al crearse nuevo rol es el asignado por el administrador
					// $sqlUserRol = $this->model->setUserRol($requestUser,$intlistRolId);
					// $arrResponse = array("status" => true, "msg" => "Se a creado el usuario");
					//opcion para actualizar el nick al crearse el usuario
					$userNIck = substr($strTxtNombre,0,1).substr($strtxtApellidos,0,1).'-0'.$requestUser;
					$fileBase = "storage/". $userNIck . "/";
					//$fileHash = substr(md5($fileBase . uniqid(microtime() . mt_rand())), 0, 8);
					// creo carpeta en servidor si no existe
					if (!file_exists($fileBase))
					mkdir($fileBase, 0777, true);
					$createNick= $this->model->createNick($requestUser, $intIdentificacion,$strTxtEmail, $userNIck,$intlistRolId,$fileBase);
					$arrResponse = array("status" => true, "msg" => "Usuario creado");
					$source ="src/images/default.png";
					$destination = 'storage/'.$userNIck.'/default.png';
					copy($source, $destination);
				}
			}
			echo json_encode($arrResponse, JSON_UNESCAPED_UNICODE);
		}
		die();
	}
		/**************************
	 * funcion para llamar a los usuarios
	 *************************/
	public function getUsers(){
		$html = "";
		$arrData = $this->model->selectUsers();
		for ($i=0; $i < count($arrData) ; $i++) {
			if ($arrData[$i]['user_status'] == 1) {
				$arrData[$i]['user_status'] = '<a style="font-size: 15px; cursor:pointer" class="badge badge-info mx-2" onClick="fntStatus(2,'.$arrData[$i]['user_id'].')">Activo</a>';
			}else{
				$arrData[$i]['user_status'] = '<a style="font-size: 15px; cursor:pointer" class="badge badge-warning mx-2" onClick="fntStatus(1,'.$arrData[$i]['user_id'].')">Inactivo</a>';
			}
		$html .= '
						<li>
							<p class="d-flex justify-content-between">'.$arrData[$i]['user_nombres'].' <strong>'. $arrData[$i]['rol_name'] .'</strong> '.$arrData[$i]['user_status'].'</p>
						</li>
		';
		}
		//convertir el arreglo de datos en un formato json
		// echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
		echo $html;
		die();
	}
	//deshabilitar usuario
	public function statusUser(){
		if($_POST){
			$statusUser = intval($_POST['status']);
			$idUser = intval($_POST['idUser']);
			$requestStatus = $this->model->statusUser($idUser,$statusUser);
			if($requestStatus){
				if($requestStatus == 1){
				$arrResponse = array('status' => true, 'msg' => 'Usuario Habilitado', 'estado' => 1);
			}else if($requestStatus == 2){
				$arrResponse = array('status' => true, 'msg' => 'Usuario Deshabilitado','estado' => 2);
			}
			}else{
				$arrResponse = array('status' => false, 'msg' => 'Error al cambiar status');
			}
			echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
		}
		die();
	} 
}