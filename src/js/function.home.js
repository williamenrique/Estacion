if (document.querySelector('#formVenta')) {
	let formUnidad = document.querySelector('#formVenta')
	formVenta.onsubmit = function (e) {
		e.preventDefault()
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
					
				} else {
					notifi(objData.msg, 'error')
				}
			}
		}
	}
}


function mueveReloj(dateObject = new Date()) {
	let hours = dateObject.getHours();
	hours = hours < 10 ? "0" + hours.toString() : hours;
	let minutes = dateObject.getMinutes();
	minutes = minutes < 10 ? "0" + minutes.toString() : minutes;
	let seconds = dateObject.getSeconds();
	seconds = seconds < 10 ? "0" + seconds.toString() : seconds;
	let horaImprimible =  hours + ":" + minutes + ":" + seconds;
	document.getElementById("txtHora").value = horaImprimible;
	setTimeout("mueveReloj()",1000)
}




















// Método que recibe un objeto date
// function mueveReloj(){
// 	momentoActual = new Date()
// 	hora = momentoActual.getHours()
// 	minuto = momentoActual.getMinutes()
// 	segundo = momentoActual.getSeconds()
// 	horaImprimible = hora + " : " + minuto + " : " + segundo
// 	document.getElementById("txtHora").value = horaImprimible
// 	setTimeout("mueveReloj()",1000)
// }