<?php
class HomeModel extends Mysql {

	public function __construct(){
		parent::__construct();
	}

	public function setVenta(int $useId, string $txtNombre, string $txtCI, int $txtListTipoVehiculo, string $txtLTS,int $txtListTipoPago,string $txtFecha, string $txtHora, string $txtMonto){
		$this->useId = $useId;
		$this->txtNombre = $txtNombre;
		$this->txtCI = $txtCI;
		$this->txtListTipoVehiculo = $txtListTipoVehiculo;
		$this->txtLTS = $txtLTS;
		$this->txtListTipoPago = $txtListTipoPago;
		$this->txtFecha = $txtFecha;
		$this->txtHora = $txtHora;
		$this->txtMonto = $txtMonto;
		$sql_insert = "INSERT INTO table_ticket_venta(nombre_ticket, ci_ticket, tipo_vehiculo_ticket, lts_ticket, tipo_pago_ticket, fecha_ticket, hora_ticket, id_user,status_ticket,monto_ticket) VALUES(?,?,?,?,?,?,?,?,?,?)";
		$arrData = array($this->txtNombre,$this->txtCI,$this->txtListTipoVehiculo,$this->txtLTS,$this->txtListTipoPago,$this->txtFecha,$this->txtHora,$this->useId,1,$this->txtMonto);
		$request_insert = $this->insert($sql_insert,$arrData);//enviamos el query y el array de datos 
		$return = $request_insert;//retorna el id insertado
		return $return;
	}
	
	public function updateTasa(float $intTasa){
		$this->intTasa = $intTasa;
		$sql = "UPDATE table_tasa_dia SET tasa_dia = ?";
		$arrData = array($this->intTasa);
		$request = $this->update($sql,$arrData);
		return $request;
	}
	public function getTasa(){
		$sql = "SELECT * FROM table_tasa_dia";
		$request = $this->select($sql);
		return $request;
	}
	public function getLastTicket(int $intIdUser, string $srtDate){
		$this->intIdUser = $intIdUser;
		$this->srtDate = $srtDate;
		$sql = "SELECT * FROM table_ticket_venta WHERE id_user = $this->intIdUser /*AND fecha_ticket = '$this->srtDate'*/ AND status_ticket = 1  ORDER BY id_ticket_venta DESC ";
		$request = $this->select_all($sql);
		return $request;
	}
	public function getDetail(int $intIdUser, string $srtDate){
		$this->intIdUser = $intIdUser;
		$this->srtDate = $srtDate;
		$sql = "SELECT tipo_vehiculo_ticket, COUNT(*) AS cant_vehiculo, monto_ticket, 
		SUM(monto_ticket) AS cant_venta, lts_ticket, SUM(lts_ticket) AS cant_lts 
		FROM table_ticket_venta WHERE id_user = $this->intIdUser /*AND fecha_ticket = '$this->srtDate'*/ AND status_ticket = 1 GROUP BY tipo_vehiculo_ticket";
		// $sql = "SELECT tipo_vehiculo_ticket, COUNT(*) AS cant_vehiculo FROM table_ticket_venta GROUP BY tipo_vehiculo_ticket";
		$request = $this->select_all($sql);
		return $request;
	}
	public function getDetailP(int $intIdUser, string $srtDate){
		$this->intIdUser = $intIdUser;
		$this->srtDate = $srtDate;
		$sql = "SELECT tipo_pago_ticket, COUNT(*) AS cant_tipo_pago,
		monto_ticket, SUM(monto_ticket) AS cant_venta
		FROM table_ticket_venta WHERE id_user = $this->intIdUser /*AND fecha_ticket = '$this->srtDate'*/ AND status_ticket = 1 GROUP BY tipo_pago_ticket";
		$request = $this->select_all($sql);
		return $request;
	}
	public function getTicket(int $intIdUser){
		$this->intIdUser = $intIdUser;
		$sql = "SELECT ttv.*, tu.* FROM table_ticket_venta ttv INNER JOIN table_user tu ON ttv.id_user = tu.user_id WHERE ttv.id_ticket_venta = $this->intIdUser";
		$request = $this->select($sql);
		return $request;
	}
	public function cierreDia(int $intIdUser, string $srtDate){
		$this->intIdUser = $intIdUser;
		$this->srtDate = $srtDate;
		$this->intStatusTicket = 0;
		$sql = "UPDATE table_ticket_venta SET status_ticket = ? WHERE id_user = $this->intIdUser /*AND fecha_ticket = '$this->srtDate' */ AND status_ticket = 1";
		$arrData = array($this->intStatusTicket);
		$request = $this->update($sql,$arrData);
		return $request;
	}
}