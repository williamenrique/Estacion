<?php 
/* Call this file 'hello-world.php' */
	require  './ticket/autoload.php';
	require  './ticket/autoload.php';
	use Mike42\Escpos\Printer;
	use Mike42\Escpos\EscposImage;
	use Mike42\Escpos\PrintConnectors\FilePrintConnector;
	use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;
	$connector = new WindowsPrintConnector("Impresora");
	// $connector = new WindowsPrintConnector("HPRT MPT-II");
	$printer = new Printer($connector);
	$intUser = $_POST['intUser'];
	$txtNombre = $_POST['txtNombre'];
	$txtCI = $_POST['txtCI'];
	$txtListTipoVehiculo = $_POST['txtListTipoVehiculo'];
	$txtLTS = $_POST['txtLTS'];
	$txtListTipoPago = $_POST['txtListTipoPago'];
	$txtFecha = $_POST['txtFecha'];
	$txtHora = $_POST['txtHora'];
	// $printer->setJustification(Printer::JUSTIFY_CENTER);
	// try{
	// 	$logo = EscposImage::load("tux.png", false);
	//     $printer->bitImage($logo);
	//     // $printer->graphics($logo);
	// }catch(Exception $e){
	// 	echo $e -> getMessage();
		/*No hacemos nada si hay error*/
	// }
	$printer -> text("Estacion de servicio tachira\n");
	$printer->text("Litros: ". $txtLTS . "\n");
	// #La fecha también
	// $printer->text(date("Y-m-d H:i:a") . "\n");
	// $printer->text("nombre de comprador" . "\n");
	// $printer->text("cedula del comprador" . "\n");
	// $printer->text("tipo de vehiculo" . "\n");
	// $printer->text("forma de pago" . "\n");
	// $printer->text("" . "\n");
	// $printer->setTextSize(2, 2);
	// $printer->setJustification(Printer::JUSTIFY_CENTER);
	// $printer->text("LTS" . "\n");
	// $printer->text("" . "\n");
	// $printer->setTextSize(1, 1);
	// $printer->text("FUE UN PLACER ATENDERLE\n");
	// $printer->text("*****************************");
	$printer->feed(5);
	$printer -> close();