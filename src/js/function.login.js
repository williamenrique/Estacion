document.addEventListener('DOMContentLoaded', function () {
    //validamos si existe el formulario
    if (document.querySelector('#formLogin')) {
        let = formlogin = document.querySelector('#formLogin')
        //le agregamos el evento submit
        formlogin.onsubmit = function (e) {
            e.preventDefault()
            let strTxtUser = document.querySelector('#txtUser').value
            let strTxtPass = document.querySelector('#txtPass').value
            if (strTxtUser == '' || strTxtPass == '') {
                Swal.fire('Por favor', 'Escriba su usuario y password', 'error',)
                return false
            } else {
                //enviar datos al controlador
                var request = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP')
                var ajaxUrl = base_url + 'Login/loginUser'
                //creamos un objeto del formulario con los datos haciendo referencia a formData
                var formData = new FormData(formlogin)
                //prepara los datos por ajax preparando el dom
                request.open('POST', ajaxUrl, true)
                //envio de datos del formulario que se almacena enla variable
                request.send(formData)
                request.onreadystatechange = function () {
                    //validamos la respuesta del DOM
                    if (request.readyState != 4) return//no hacemos nada
                    if (request.status == 200) {
                        //convertir en json lo obtenido
                        var objData = JSON.parse(request.responseText)
                        //verfificamos si es verdadero la respuesta en json del controlador
                        if (objData.status) {
                            window.location = base_url + 'home'
                        } else {
                            Swal.fire('Atencion', objData.msg, 'error',)
                            document.querySelector('#txtPass').value = ""
                        }
                    } else {
                        Swal.fire('Atencion', 'Error en el proceso', 'error',)
                    }
                    return false
                }
            }
        }
    }
}, false)