<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LOGIN</title>
    <link rel="stylesheet" href="<?= PLUGINS ?>css/sweetalert2.css">
    <link rel="stylesheet" href="<?= CSS ?>azia.css">
</head>
<body>
    
    <div class="az-signin-wrapper">
      <div class="az-card-signin">
        <div class="az-signin-header">
          <h2 class="text-center">Bienvenido</h2>
          <h4 class="text-center">Por favor inicie para continuar</h4>

          <form id="formLogin">
            <div class="form-group">
              <label>Email</label>
              <input type="text" class="form-control" id="txtUser" name="txtUser" autofocus placeholder="Coloque su usuario o email">
            </div><!-- form-group -->
            <div class="form-group">
              <label>Password</label>
              <input type="password" class="form-control"  id="txtPass" name="txtPass" placeholder="coloque su password" >
            </div><!-- form-group -->
            <button type="submit" class="btn btn-az-primary btn-block btnIniciar">Iniciar</button>
          </form>
        </div><!-- az-signin-header -->
       
      </div><!-- az-card-signin -->
    </div><!-- az-signin-wrapper -->

    <script> const base_url = "<?= base_url() ?>";</script>
	<script src="<?= PLUGINS ?>js/jquery.min.js"></script>
	<script src="<?= PLUGINS ?>js/bootstrap.bundle.min.js"></script>
	<script src="<?= PLUGINS ?>js/sweetalert2@10.js"></script>
	<script src="<?= JS?>function.main.js"></script>
	<script src="<?= JS?>function.login.js"></script>
</body>
</html>