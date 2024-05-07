function soloNumeros(e) {
    key = e.keyCode || e.which
    tecla = String.fromCharCode(key).toLowerCase()
    letras = "0123456789"
    especiales = "8-37-39-46"

    tecla_especial = false
    for (var i in especiales) {
        if (key == especiales[i]) {
            tecla_especial = true
            break
        }
    }

    if (letras.indexOf(tecla) == -1 && !tecla_especial) {
        return false
    }
}
function soloLetras(e) {
    key = e.keyCode || e.which
    tecla = String.fromCharCode(key).toLowerCase()
    letras = " áéíóúabcdefghijklmnñopqrstuvwxyz."
    especiales = "8-37-39-46"

    tecla_especial = false
    for (var i in especiales) {
        if (key == especiales[i]) {
            tecla_especial = true
            break
        }
    }

    if (letras.indexOf(tecla) == -1 && !tecla_especial) {
        return false
    }
}
/****
 * funcion para la notificacion
 */
function notifi(data, icon) {
    $(function () {
        var Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000
        })
        Toast.fire({
            icon: icon,
            title: data
        })
    })
}

(function () {
    'use strict'
    window.addEventListener('load', function () {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.getElementsByClassName('needs-validation')
        // Loop over them and prevent submission
        var validation = Array.prototype.filter.call(forms, function (form) {
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault()
                    event.stopPropagation()
                }
                form.classList.add('was-validated')
            }, false)
        })
    }, false)
})()