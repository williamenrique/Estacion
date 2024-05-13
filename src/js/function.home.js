document.addEventListener('DOMContentLoaded', function () {
	
	/**********cargar flota en la tabla**********/
	if(document.querySelector('#listTickets')){
		$("#listTickets").DataTable({
			 order: [[3, 'desc']],
			"responsive": true, "lengthChange": false, "autoWidth": true,
			"buttons": ["copy", "csv", "excel", "pdf", "print"],
			pageLength: 10,
			"language": {
				"sProcessing": "Procesando...",
				"sLengthMenu": "Mostrar _MENU_ registros",
				"sZeroRecords": "No se encontraron resultados",
				"sEmptyTable": "Ningún dato disponible",
				"sInfo": "Total de _TOTAL_ Registros",
				"sInfoEmpty": "Registros del 0 al 0 de un total de 0 registros",
				"sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
				"sInfoPostFix": "",
				"sSearch": "Buscar:",
				"sUrl": "",
				"sInfoThousands": ",",
				"sLoadingRecords": "Cargando...",
				"oPaginate": {
					"sFirst": "Primero",
					"sLast": "Último",
					"sNext": "Siguiente",
					"sPrevious": "Anterior"
				},
				"oAria": {
					"sSortAscending": ": Activar para ordenar la columna de manera ascendente",
					"sSortDescending": ": Activar para ordenar la columna de manera descendente"
				}
			},
			"ajax": {
				"url": ' ' + base_url + 'Home/getLastTicket',
				"dataSrc": ''
			},
			
			"columns": [
				// { 'data': 'id_ticket' },
				// { 'data': 'fecha_ticket' },
				// { 'data': 'hora_ticket' }
				{ 'data': 'ticket' }
			],
		})
	}
})
if (document.querySelector('#formVenta')) {
	let formUnidad = document.querySelector('#formVenta')
	formVenta.onsubmit = function (e) {
		e.preventDefault()
		let srtNombre = document.querySelector('#txtNombre').value
		let srtCI = document.querySelector('#txtCI').value
		let srtListTipoVehiculo = document.querySelector('#txtListTipoVehiculo').value
		let srtLTS = document.querySelector('#txtLTS').value
		let srtListTipoPago = document.querySelector('#txtListTipoPago').value
		let srtFecha = document.querySelector('#txtFecha').value
		let srtHora = document.querySelector('#txtHora').value
		let srtNombreOperador = document.querySelector('#txtNombreOperador').value
		//hacer una validacion para diferentes navegadores y crear el formato de lectura y hacemos la peticion mediante ajax
		//usando un if reducido creamos un objeto del contenido en (request)
		let request = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP')
		let ajaxUrl = base_url + 'Home/setVenta'
		//creamos un objeto del formulario con los datos haciendo referencia a formData
		let formData = new FormData(formVenta)
		//prepara los datos por ajax preparando el dom
		request.open('POST', ajaxUrl, true)
		//envio de datos del formulario que se almacena enla variable
		request.send(formData)
		//despues del envio retornamos una funcion con los datos
		request.onreadystatechange = function () {
			//validamos la respuesta del servidor al enviar los datos
			if (request.readyState == 4 && request.status == 200) {
				//obtener el json y convertirlo a un objeto en javascript
				var objData = JSON.parse(request.responseText)
				//condionamos la respuesta del array del controlador
				if (objData.status) {
					formVenta.reset()
					notifi(objData.msg, 'success')
					fntImprimir(objData.nTicket, srtNombre, srtCI, srtListTipoVehiculo, srtLTS, srtListTipoPago, srtFecha, srtHora, srtNombreOperador)
				} else {
					notifi(objData.msg, 'error')
				}
			}
		}
	}
}
function mueveReloj(dateObject = new Date()) {
	let hours = dateObject.getHours()
	hours = hours < 10 ? "0" + hours.toString() : hours
	let minutes = dateObject.getMinutes()
	minutes = minutes < 10 ? "0" + minutes.toString() : minutes
	let seconds = dateObject.getSeconds()
	seconds = seconds < 10 ? "0" + seconds.toString() : seconds
	let horaImprimible =  hours + ":" + minutes + ":" + seconds
	document.getElementById("txtHora").value = horaImprimible
	setTimeout("mueveReloj()",1000)
}
function fntImprimir(intTicket, srtNombre, srtCI, srtListTipoVehiculo, srtLTS, srtListTipoPago, srtFecha, srtHora,srtNombreOperador){
	var saveData = Array() //Declaro el arreglo
    saveData['srtNombre'] = srtNombre
    saveData['srtCI'] = srtCI
    saveData['srtLTS'] = srtLTS
    saveData['intTicket'] = intTicket
    saveData['srtListTipoVehiculo'] = srtListTipoVehiculo
    saveData['srtListTipoPago'] = srtListTipoPago
    saveData['srtFecha'] = srtFecha
    saveData['srtHora'] = srtHora
    saveData['srtNombreOperador'] = srtNombreOperador
    //Lo convierto a objeto
    var jObject={}
    for(i in saveData){
        jObject[i] = saveData[i]
    }
    //Luego lo paso por JSON  a un archivo php llamado js.php
    jObject= JSON.stringify(jObject)
    $.ajax({
            type:'post',
            cache:false,
            url: base_url + "ticket.php",
            data:{dataTicket:  jObject},
            success:function(server){
            	console.log(server)//cuando reciva la respuesta lo imprimo
            }
     })
}
function lastTicket() {
	let ajaxUrl = base_url + "Home/getLastTicket"
	//creamos el objeto para os navegadores
	var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP')
	//abrimos la conexion y enviamos los parametros para la peticion
	request.open("POST", ajaxUrl, true)
	request.send()
	request.onreadystatechange = function () {
		if (request.readyState == 4 && request.status == 200) {
			//option obtenidos del controlador
			document.querySelector('.listTickets').innerHTML = request.responseText
		}
	}
}
window.addEventListener('load', function () {
	
}, false)
function fntTicket(idTicket) {
	let ajaxUrl = base_url + "Home/getTicket/" + idTicket
	//creamos el objeto para os navegadores
	var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP')
	//abrimos la conexion y enviamos los parametros para la peticion
	request.open("POST", ajaxUrl, true)
	request.send()
	request.onreadystatechange = function () {
		//todo va bien 
		if (request.readyState == 4 && request.status == 200) {
			let objData = JSON.parse(request.responseText)
			let intTicket = objData.id_ticket_venta
			let srtNombre = objData.nombre_ticket
			let srtCI = objData.ci_ticket
			let srtListTipoVehiculo = objData.tipo_vehiculo_ticket
			let srtLTS = objData.lts_ticket
			let srtListTipoPago = objData.tipo_pago_ticket
			let srtFecha = objData.fecha_ticket
			let srtHora = objData.hora_ticket
			let srtNombreOperador = objData.user_nombres
			fntImprimir(intTicket, srtNombre, srtCI, srtListTipoVehiculo, srtLTS, srtListTipoPago, srtFecha, srtHora,srtNombreOperador)
		}
	}
}