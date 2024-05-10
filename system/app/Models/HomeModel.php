<?php
class HomeModel extends Mysql {

	public function __construct(){
		parent::__construct();
	}

	public function setVenta(int $useId, string $txtNombre, string $txtCI, int $txtListTipoVehiculo, string $txtLTS,int $txtListTipoPago,string $txtFecha, string $txtHora){
		$this->useId = $useId;
		$this->txtNombre = $txtNombre;
		$this->txtCI = $txtCI;
		$this->txtListTipoVehiculo = $txtListTipoVehiculo;
		$this->txtLTS = $txtLTS;
		$this->txtListTipoPago = $txtListTipoPago;
		$this->txtFecha = $txtFecha;
		$this->txtHora = $txtHora;
		$sql_insert = "INSERT INTO table_ticket_venta(nombre_ticket, ci_ticket, tipo_vehiculo_ticket, lts_ticket, tipo_pago_ticket, fecha_ticket, hora_ticket, id_user) VALUES(?,?,?,?,?,?,?,?)";
		$arrData = array($this->txtNombre,$this->txtCI,$this->txtListTipoVehiculo,$this->txtLTS,$this->txtListTipoPago,$this->txtFecha,$this->txtHora,$this->useId);
		// armamos el array con los datos obtenidos
		$request_insert = $this->insert($sql_insert,$arrData);//enviamos el query y el array de datos 
		$return = $request_insert;//retorna el id insertado
		return $return;
	}
	public function getLastTicket(int $intIdUser){
		$this->intIdUser = $intIdUser;
		$sql = "SELECT * FROM table_ticket_venta WHERE id_user = $this->intIdUser ORDER BY id_ticket_venta DESC ";
		$request = $this->select_all($sql);
		return $request;
	}
	public function getTicket(int $intIdUser){
		$this->intIdUser = $intIdUser;
		$sql = "SELECT ttv.*, tu.* FROM table_ticket_venta ttv INNER JOIN table_user tu ON ttv.id_user = tu.user_id WHERE ttv.id_ticket_venta = $this->intIdUser";
		$request = $this->select($sql);
		return $request;
	}
}