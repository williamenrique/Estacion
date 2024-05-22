<!DOCTYPE html>
<html lang="es">

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Estacion de servicio</title>
		<!-- Google Font: Source Sans Pro -->
		<link rel="stylesheet"
			href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
		<!-- <link rel="stylesheet" href="<?= PLUGINS ?>css/dataTables.bootstrap4.min.css">
		<link rel="stylesheet" href="<?= PLUGINS ?>css/responsive.bootstrap4.min.css">
		<link rel="stylesheet" href="<?= PLUGINS ?>css/buttons.bootstrap4.min.css"> -->
		<link rel="stylesheet" href="https://cdn.datatables.net/2.0.7/css/dataTables.bootstrap4.css">
		<link rel="stylesheet" href="<?= PLUGINS ?>css/sweetalert2.css">
		<link rel="stylesheet" href="<?= PLUGINS ?>css/all.min.css">
		<link rel="stylesheet" href="<?= CSS ?>adminlte.min.css">
		<link rel="stylesheet" href="<?= CSS ?>custom.css">
	</head>


	<body class="hold-transition layout-top-nav" onload="mueveReloj()">
		<div class="wrapper">
			<!-- Navbar -->
			<nav class="main-header navbar navbar-expand-md navbar-light navbar-white">
				<div class="container">
					<a href="<?= base_url()?>" class="navbar-brand">
						<!-- <img src="../../dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
							style="opacity: .8"> -->
						<span class="brand-text font-weight-light">E/S TACHIRA</span>
					</a>

					<button class="navbar-toggler order-1" type="button" data-toggle="collapse" data-target="#navbarCollapse"
						aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<!-- <div class="collapse navbar-collapse order-3" id="navbarCollapse"> -->
					<!-- Left navbar links -->
					<!-- <ul class="navbar-nav">
							<li class="nav-item">
								<a href="<?= base_url()?>" class="nav-link">INICIO</a>
							</li>
							<li class="nav-item">
								<a href="#" class="nav-link">VENTA</a>
							</li>
							<li class="nav-item">
								<a href="#" class="nav-link">REPORTE</a>
							</li> -->
					<!-- <li class="nav-item dropdown">
								<a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
									class="nav-link dropdown-toggle">Dropdown</a>
								<ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow">
									<li><a href="#" class="dropdown-item">Some action </a></li>
									<li><a href="#" class="dropdown-item">Some other action</a></li>

									<li class="dropdown-divider"></li>
									<li class="dropdown-submenu dropdown-hover">
										<a id="dropdownSubMenu2" href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false" class="dropdown-item dropdown-toggle">Hover for action</a>
										<ul aria-labelledby="dropdownSubMenu2" class="dropdown-menu border-0 shadow">
											<li>
												<a tabindex="-1" href="#" class="dropdown-item">level 2</a>
											</li>

											<li class="dropdown-submenu">
												<a id="dropdownSubMenu3" href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false" class="dropdown-item dropdown-toggle">level 2</a>
												<ul aria-labelledby="dropdownSubMenu3" class="dropdown-menu border-0 shadow">
													<li><a href="#" class="dropdown-item">3rd level</a></li>
													<li><a href="#" class="dropdown-item">3rd level</a></li>
												</ul>
											</li>

											<li><a href="#" class="dropdown-item">level 2</a></li>
											<li><a href="#" class="dropdown-item">level 2</a></li>
										</ul>
									</li>
								</ul>
							</li> -->
					<!-- </ul> -->


				</div>

				<!-- Right navbar links -->
				<ul class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto">

					<!-- Notifications Dropdown Menu -->
					<li class="nav-item dropdown">
						<a class="nav-link" data-toggle="dropdown" href="#">
							<i class="fas fa-cogs"></i>
							<!-- <span class="badge badge-warning navbar-badge">15</span> -->
						</a>
						<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
							<span class="dropdown-header">Panel de ajustes</span>
							<div class="dropdown-divider"></div>

							<div class="dropdown-divider"></div>
							<a href="<?= base_url()?>usuario/perfil" class="dropdown-item">
								<i class="fas fa-users mr-2"></i> Perfil
								<!-- <span class="float-right text-muted text-sm">12 hours</span> -->
							</a>
							<div class="dropdown-divider"></div>
							<?php
								if($_SESSION['userData']['rol_id'] == 1){
									?>
							<a href="<?= base_url()?>usuario/createuser" class="dropdown-item">
								<i class="fas fa-user mr-2"></i> CREAR USUARIO
							</a>
							<?php
								}
								?>
							<?php
								if($_SESSION['userData']['rol_id'] == 1){
									?>
							<a href="javascript:;" class="dropdown-item" onclick="fntBackup()"><i
									class="fas fa-file-export mr-2"></i>BAKCUP</a>
							<?php
								}
								?>
							<div class="dropdown-divider"></div>
							<a href="<?= base_url()?>logout" class="dropdown-item dropdown-footer">CERRAR SESION</a>
						</div>
					</li>

				</ul>
		</div>
		</nav>
		<!-- /.navbar -->