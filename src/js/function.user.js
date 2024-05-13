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
/*****************
 * actualizar perfil
 */
function compararPass() {
	if (strPass != strPassC) {
		Swal.fire('Password  no coinciden!', 'Oops...', 'info');
		return false;
	}
	var strPass = document.querySelector('#textPass').value;
	var strPassC = document.querySelector('#textPassConfirm').value;
}
//actualizar datos
if (document.querySelector('#formDatos')) {
	var	formDatos = document.querySelector('#formDatos');
	formDatos.onsubmit = function (e) {
		e.preventDefault();
		/*************************************************
		* creamos el objeto de envio para tipo de navegador
		* hacer una validacion para diferentes navegadores y crear el formato de lectura
		* y hacemos la peticion mediante ajax
		* usando un if reducido creamos un objeto del contenido en(request)
		*****************************************************/
		let request = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
		let ajaxUrl = base_url + 'Usuario/UpdatePerfil';
		//creamos un objeto del formulario con los datos haciendo referencia a formData
		let formData = new FormData(formDatos );
		//prepara los datos por ajax preparando el dom
		request.open('POST', ajaxUrl, true);
		//envio de datos del formulario que se almacena enla variable
		request.send(formData);
		//obtenemos los resultados y evaluamos
		request.onreadystatechange = function () {
			if (request.readyState == 4 && request.status == 200) {
				//obtenemos los datos y convertimos en JSON
				let objData = JSON.parse(request.responseText);
				//leemos el ststus de la respuesta
				if (objData.status) {
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
					location.reload();
					//Swal.fire('Usuario', objData.msg, 'success');
				} else {
					Swal.fire({
						icon: 'error',
						title: 'Oops...',
						text: objData.msg
					})
				}
			}
		}
	}
}
//cambiar password
if (document.querySelector('#formPass')) {
	var	formPass = document.querySelector('#formPass');
	formPass.onsubmit = function (e) {
		e.preventDefault();
		/*************************************************
		* creamos el objeto de envio para tipo de navegador
		* hacer una validacion para diferentes navegadores y crear el formato de lectura
		* y hacemos la peticion mediante ajax
		* usando un if reducido creamos un objeto del contenido en(request)
		*****************************************************/
		let request = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
		let ajaxUrl = base_url + 'Usuario/UpdatePerfil';
		//creamos un objeto del formulario con los Pass haciendo referencia a formData
		let formData = new FormData(formPass );
		//prepara los datos por ajax preparando el dom
		request.open('POST', ajaxUrl, true);
		//envio de datos del formulario que se almacena enla variable
		request.send(formData);
		//obtenemos los resultados y evaluamos
		request.onreadystatechange = function () {
			if (request.readyState == 4 && request.status == 200) {
				//obtenemos los datos y convertimos en JSON
				let objData = JSON.parse(request.responseText);
				//leemos el ststus de la respuesta
				if (objData.status) {
					// $("#modalUser").modal("hide");
					Swal.fire('Usuario', objData.msg, 'success');
					formPass.reset()
					// tableUser.ajax.reload()
				} else {
					Swal.fire({
						icon: 'error',
						title: 'Oops...',
						text: objData.msg
					})
				}
			}
		}
	}
}