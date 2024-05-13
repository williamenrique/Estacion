<?php
class UsuarioModel extends Mysql {
	private $intIdentificacion;
	private $intIdUser;
	private $strTxtNombre;
	private $strtxtApellidos;
	private $intTxtTlf;
	private $strTxtEmail;
	private $intListStatus;
	private $intlistRolId;
	private $strTxtPass;
	private $strToken;
	private $strNick;
	private $strTxtNick;
	private $intOption;
	private $intStatus;
	private $fileBase;
	private $intRol;
	public function __construct(){
		parent::__construct();
	}
	/*********************
	 * funcion de insertar usuario en la DB
	 *********************/
	public function insertUser(int $intIdentificacion, string $strTxtNombre,string $strtxtApellidos,int $intTxtTlf, string	$strTxtEmail, int 	$intListStatus,int $intlistRolId,string $strTxtPass){
		$this->intId =  $intIdentificacion;
		$this->strTxtNombre =  $strTxtNombre;
		$this->strtxtApellidos =  $strtxtApellidos;
		$this->intTxtTlf =  $intTxtTlf;
		$this->strTxtEmail =  $strTxtEmail;
		$this->intListStatus =  $intListStatus;
		$this->intlistRolId =  $intlistRolId;
		$this->strTxtPass =  $strTxtPass;
		$this->strImg = "storage/default.png";
		$return = 0;
		//consultar si existe
		$sql = "SELECT * FROM table_user WHERE  user_email = '{$this->strTxtEmail}' or  user_ci = {$this->intId}";
		$request = $this->select_all($sql);
		//si no encontro ningun resultado insertamos el usuario
		if(empty($request)){
			$queryInsert = "INSERT INTO table_user(user_ci,user_nombres,user_apellidos, user_tlf,user_email,user_status,user_img, user_rol,user_pass) VALUES(?,?,?,?,?,?,?,?,?)";
			$arrData = array($this->intId,$this->strTxtNombre,$this->strtxtApellidos,$this->intTxtTlf,$this->strTxtEmail,$this->intListStatus,$this->strImg,$this->intlistRolId,$this->strTxtPass);
			$requestInsert = $this->insert($queryInsert,$arrData);
			//si no existe devolvemos el id de insert
			$return = $requestInsert;
			$userNIck = substr($strTxtNombre,0,1).substr($strtxtApellidos,0,1).'-0'.$requestInsert;
			$insertRol = "INSERT INTO table_user_rol(user_nick,id_rol) VALUES(?,?)";
			$arrDataRol = array($userNIck,$this->intlistRolId);
		}else{
			//si existe un registro devolvemos 0
			$return = 0;
		}
		return $return;
	}
	/**
	 * crear el usuario desde admin al ingresar un nuevo empleado
	 *
	 */
	public function createNick(int $intIdUser,int $intIdentificacion,string $strTxtEmail, string $strTxtNick,int $intlistRolId,string $fileBase ){
		$this->intIdUser = $intIdUser;
		$this->strTxtEmail = $strTxtEmail;
		$this->intIdentificacion = $intIdentificacion;
		$this->strTxtNick = $strTxtNick;
		$this->intlistRolId = $intlistRolId;
		$this->fileBase = $fileBase;
		$sql = "SELECT * FROM table_user WHERE user_id = $this->intIdUser";
		$request = $this->select_all($sql);
		if(!empty($request)){
			$sql = "UPDATE table_user SET  user_nick = ?, user_ruta = ? , user_img = ? WHERE user_id = $this->intIdUser AND user_ci = $this->intIdentificacion";
			$arrData = array($this->strTxtNick,$this->fileBase,$this->fileBase.'default.png');
			$request = $this->update($sql,$arrData);
			$insertRol = "INSERT INTO table_user_rol(user_nick,id_rol) VALUES(?,?)";
			$arrDataRol = array($this->strTxtNick,$this->intlistRolId);
			$Rol = $this->insert($insertRol,$arrDataRol);
		}else{
			$request = "error";
		}
		return $request;
	}
	/*********************
	 * funcion de cargar usuario de la DB
	 *********************/
	public function selectUsers(){
		@session_start();
		$sql = "SELECT p.user_id, p.user_nick,p.user_nombres,p.user_apellidos,p.user_tlf,
		p.user_email, p.user_status,rol.rol_id,rol.rol_name
					FROM table_user p
					JOIN table_user_rol r
					JOIN table_roles rol
					WHERE
					p.user_nick = r.user_nick AND
					r.id_rol = rol.rol_id AND
					p.user_status != 0 AND p.user_id != {$_SESSION['userData']['user_id']}";
		$request = $this->select_all($sql);
		return $request;
	}
		/*****************
	 * deshabilitar usuario
	 */
	public function statusUser(int $intIdUser, int $intStatus){
		$this->intIdUser = $intIdUser;
		$this->intStatus = $intStatus;
		$sql = "UPDATE table_user SET user_status = ? WHERE user_id = $this->intIdUser";
		$arrData = array($this->intStatus);
		$request = $this->update($sql,$arrData);
		if($this->intStatus == 1){
			$request = "1";
		}else{
			$request = "2";
		}
		return $request;
	}
		public function updatePerfil(int $intIdUser,string $strTxtNombre,string $strtxtApellidos,string  $intTxtTlf,int $intIdentificacion,string $strTxtEmail,string $strTxtPass, string $strTxtNick, int $intOption,string $fileBase){
		$this->intIdUser = $intIdUser;
		$this->strTxtNombre = $strTxtNombre;
		$this->strtxtApellidos = $strtxtApellidos;
		$this->intTxtTlf = $intTxtTlf;
		$this->strTxtEmail = $strTxtEmail;
		$this->intIdentificacion = $intIdentificacion;
		$this->strTxtPass = $strTxtPass;
		$this->strTxtNick = $strTxtNick;
		$this->intOption = $intOption;
		$this->fileBase = $fileBase;
		$sql = "SELECT * FROM table_user WHERE (user_email = '{$this->strTxtEmail}' AND user_id = $this->intIdUser) OR (user_ci = $this->intIdentificacion AND user_id = $this->intIdUser)";
		$request = $this->select($sql);
			if($this->intOption == 1){
				$sql = "UPDATE table_user SET  user_nombres = ?, user_apellidos = ?, user_tlf = ? WHERE user_id = $this->intIdUser AND user_ci = $this->intIdentificacion";
				$arrData = array(
					$this->strTxtNombre,
					$this->strtxtApellidos,
					$this->intTxtTlf
				);
			}else	if($this->intOption == 2){
				//comprovar que el usuario no exista
				$sqlNick = "SELECT * FROM table_user WHERE user_nick = '{$this->strTxtNick}'";
				$requestNick = $this->select($sqlNick);
				if($requestNick["user_nick"] == $this->strTxtNick){
					$request = "exist";
				}else{
					$sql = "UPDATE table_user SET  user_nick = ? WHERE user_id = $this->intIdUser AND user_ci = $this->intIdentificacion";
					$arrData = array($this->strTxtNick);
				}
			}else	if($this->intOption == 3){
				$sql = "UPDATE table_user SET  user_pass = ? WHERE user_id = $this->intIdUser AND user_ci = $this->intIdentificacion";
				$arrData = array($this->strTxtPass);
			}
			// echo $sql;
			$request = $this->update($sql,$arrData);
		return $request;
	}
}