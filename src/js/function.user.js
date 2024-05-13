if (document.querySelector('#formNewOperador')) {
	var formUser = document.querySelector('#formNewOperador')
	//agregar el evento al boton del formulario
	formUser.onsubmit = (e) => {
		e.preventDefault()
		//obenemos todos los valores del formulario  txtIdentificacion
		// let intIngreso =  document.querySelector('#ingreso').value
		var strIdentificacion = document.querySelector('#txtIdentificacion').value
		var strTxtNombre = document.querySelector('#txtNombres').value
		var strtxtApellidos = document.querySelector('#txtApellidos').value
		var intTxtTlf = document.querySelector('#txtTlf').value
		var strTxtEmail = document.querySelector('#txtEmail').value
		var strListStatus = document.querySelector('#listStatus').value
		var intlistRolId = document.querySelector('#listRolId').value
		/*************************************************
		* creamos el objeto de envio para tipo de navegador
		* hacer una validacion para diferentes navegadores y crear el formato de lectura
		* y hacemos la peticion mediante ajax
		* usando un if reducido creamos un objeto del contenido en(request)
		*****************************************************/
		let request = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP')
		let ajaxUrl = base_url + 'Usuario/setUser'
		//creamos un objeto del formulario con los datos haciendo referencia a formData
		let formData = new FormData(formUser )
		//prepara los datos por ajax preparando el dom
		request.open('POST', ajaxUrl, true)
		//envio de datos del formulario que se almacena enla variable
		request.send(formData)
		//obtenemos los resultados
		request.onreadystatechange = () =>{
			if (request.readyState == 4 && request.status == 200) {
				//obtenemos los datos y convertimos en JSON
				let objData = JSON.parse(request.responseText)
				//leemos el ststus de la respuesta
				if (objData.status) {
					notifi(objData.msg, 'success')
					formUser.reset()
					listUser()
				} else {
					notifi(objData.msg, 'error')
				}
			}
		}
	}
}
listUser = () => {
	let request = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP')
	let ajaxUrl = base_url + 'Usuario/getUsers'
	//creamos un objeto del formulario con los datos haciendo referencia a formData
	let formData = new FormData(formUser )
	//prepara los datos por ajax preparando el dom
	request.open('POST', ajaxUrl, true)
	//envio de datos del formulario que se almacena enla variable
	request.send(formData)
	//obtenemos los resultados
	request.onreadystatechange = () =>{
		if (request.readyState == 4 && request.status == 200) {
			//option obtenidos del controlador
			document.querySelector('.listUser').innerHTML = request.responseText;
		}
	}
}
if (document.querySelector('.listUser')) {
	listUser()
}

/*************
 * cambiar status
 */
function fntStatus(status,idUser) {
	//obtenemos el valor del atributo individual
	var status = status;
	Swal.fire({
		title: 'Estas seguro de cambiar el estado del usuario?',
		// text: "No podra ser revertido el proceso!",
		icon: 'info',
		showCancelButton: true,
		confirmButtonColor: 'btn btn-success',
		cancelButtonColor: 'btn btn-danger',
		confirmButtonText: 'Si, cambiar!'
	}).then((result) => {
		if (result.isConfirmed) {
			//hacer una validacion para diferentes navegadores y crear el formato de lectura y hacemos la peticion mediante ajax
			let request = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
			let ajaxUrl = base_url + 'Usuario/statusUser/';
			//id del atributo lr que obtuvimos enla variable
			// let strData = [{"status" :status,"idUser": idUser}];
			let strData = new URLSearchParams("idUser="+idUser+"&status="+status);
			request.open("POST", ajaxUrl, true);
			//forma en como se enviara
			request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			//enviamos
			request.send(strData);
			// request.send();
			request.onreadystatechange = function () {
				//comprobamos la peticion
				if (request.readyState == 4 && request.status == 200) {
					//convertir en objeto JSON
					let objData = JSON.parse(request.responseText);
					if (objData.status) {
						if (objData.estado == 1) {
							$(function () {
								var Toast = Swal.mixin({
									toast: true,
									position: 'top-end',
									showConfirmButton: false,
									timer: 3000
								})
								Toast.fire({
									icon: 'success',
									title: objData.msg
								})
							})
							// if (boxUserHigh) {
							// 	tableUserHigh.ajax.reload();
							// }
						} else {
							$(function () {
								var Toast = Swal.mixin({
									toast: true,
									position: 'top-end',
									showConfirmButton: false,
									timer: 3000
								})
								Toast.fire({
									icon: 'success',
									title: objData.msg
								})
							})
						}
						listUser()
					} else {
						Swal.fire('Atencion!', objData.msg, 'error');
					}
				}
			}
		}
	})
}