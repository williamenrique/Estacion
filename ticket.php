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
	// $intTicket = $_POST['intTicket'];
	// $intUser = $_SESSION['userData']['user_id'];
	// $txtNombre = $_POST['txtNombre'];
	// $txtCI = $_POST['txtCI'];
	// $txtLTS = $_POST['txtLTS'];
	// $txtFecha = $_POST['txtFecha'];
	// $txtHora = $_POST['txtHora'];
	// $txtListTipoPago = $_POST['txtListTipoPago'];
	// $txtListTipoVehiculo = $_POST['txtListTipoVehiculo'];
	
		// $tipoPago = ($txtListTipoPago == 1) ? "Divisa" : (($txtListTipoPago == 2) ? "Efectivo Bs" : "Punto de venta");
		// $tipoVehiculo = ($txtListTipoVehiculo == 1) ? "Camion" : (($txtListTipoVehiculo == 2) ? "Carro" : "Moto");
		// $people_json = get_contents($_POST);

		// echo $decoded_json->srtNombre;

/*
    saveData['srtListTipoVehiculo'] = srtListTipoVehiculo;
    saveData['srtListTipoPago'] = srtListTipoPago;
    saveData['srtFecha'] = srtFecha;
    saveData['srtHora'] = srtHora;
*/


		if(isset($_POST)){
			// $arrayRecibido=json_decode($_POST["jObject"], true );
			$dataTicket = json_decode($_POST['dataTicket'], true);
			// echo "Hemos recibido en el PHP un array de ".count($arrayRecibido)." elementos";
			// foreach($arrayRecibido as $valor){
			
			// 	echo "\n- ".$valor;
			// }
			$tipoPago = ($dataTicket['srtListTipoPago'] == 4) ? "Divisa" : (($dataTicket['srtListTipoPago'] == 5) ? "Efectivo Bs" : "Punto de venta");
			$tipoVehiculo = ($dataTicket['srtListTipoVehiculo'] == 1) ? "Carro" : (($dataTicket['srtListTipoVehiculo'] == 2) ? "Camion" : "Moto");
				$printer->setTextSize(2, 2);
				$printer -> text("Ticket N" ." ". $dataTicket['intTicket'] ."\n");
				$printer->feed(1);
				$printer->setTextSize(1, 1);
				$printer -> text("E/S TACHIRA\n");
				$printer -> text("Servicio Socialista de\n");
				$printer -> text("Abastecimiento del Edo Yaracuy\n");
				// $printer->text("Fecha: \n");
				$printer->text($dataTicket['srtFecha'] ." - ". $dataTicket['srtHora'] . "\n");
				$printer->text("Operador : " .$dataTicket['srtNombreOperador']  . "\n");
				$printer->text("Cliente : " .$dataTicket['srtNombre']  . "\n");
				$printer->text("CI :". $dataTicket['srtCI'] . "\n");
				$printer->text("Vehiculo :" . $tipoVehiculo . "\n");
				$printer->text("Pago :" . $tipoPago . "\n");
				$printer->text("" . "\n");
				$printer->setTextSize(2, 2);
				$printer->setJustification(Printer::JUSTIFY_CENTER);
				$printer->text("    ".$dataTicket['srtLTS'] . "LTS\n");
				$printer->text("" . "\n");
				$printer->setTextSize(1, 1);
				$printer->text("FUE UN PLACER ATENDERLE\n");
				$printer->text("*****************************");
				$printer->feed(5);
				$printer -> close();
			
	}