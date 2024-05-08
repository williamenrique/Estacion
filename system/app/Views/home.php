<?= head($data)?>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container">
			<div class="row mb-2">
				<div class="col-sm-6">
					<!-- <h1 class="m-0">VENTAS Y <small>REPORTES</small></h1> -->
				</div><!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<!-- <li class="breadcrumb-item"><a href="#">Layout</a></li>
						<li class="breadcrumb-item active">Top Navigation</li> -->
					</ol>
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.container-fluid -->
	</div>
	<!-- /.content-header -->

	<!-- Main content -->
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="card">
						<div class="card-header">

							<h5 class="card-title">Iniciar una venta</h5>
						</div>
						<form id="formVenta" name="form_reloj">
							<div class="card-body">
								<div class="row">
									<div class="form-group col-lg-4">
										<label for="txtNombre">NOMBRE</label>
										<input type="text" class="form-control" id="txtNombre" name="txtNombre"
											placeholder="Nombre de la persona">
									</div>
									<div class="form-group col-lg-3">
										<label for="txtCI">CI</label>
										<input type="text" class="form-control" id="txtCI" name="txtCI" placeholder="Cedula">
									</div>
									<div class="form-group col-sm-4">
										<label>TIPO VEHICULO</label>
										<select id="txtListTipoVehiculo" name="txtListTipoVehiculo" class="form-control">
											<option value="1">CAMION</option>
											<option value="2">CARRO</option>
											<option value="3">MOTO</option>
										</select>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-lg-2">
										<label for="txtLTS">LITROS</label>
										<input type="text" class="form-control" id="txtLTS" name="txtLTS" placeholder="Litros">
									</div>
									<div class="form-group col-sm-4">
										<label>TIPO PAGO</label>
										<select id="txtListTipoPago" id="txtListTipoPago" name="txtListTipoPago" class="form-control">
											<option value="1">DIVISA</option>
											<option value="2">EFECTIVO</option>
											<option value="3">PUNTO DE VENTA</option>
										</select>
									</div>
									<div class="form-group col-lg-2">
										<label for="txtFecha">FECHA</label>
										<input type="text" class="form-control" id="txtFecha" name="txtFecha" readonly
											value="<?= date('d-m-y')?>">
									</div>
									<div class="form-group col-lg-2">
										<label for="txtHora">HORA</label>
										<input type="text" class="form-control" id="txtHora" name="txtHora" readonly value="">
									</div>
								</div>
								<a href="#" class="card-link">Atendido por : <?= $_SESSION['userData']['user_nombres']?></a>
								<a href="#" class="card-link">E/S Tachira</a><br>
							</div>
							<div class="card-footer">
								<button class="btn btn-primary" type="submit">ACEPTAR</button>
								<button class="btn btn-danger" type="button">CANCELAR</button>
							</div>

						</form>
					</div>
				</div>

				<!-- /.col-md-6 -->
				<div class="col-lg-4">
					<div class="card">
						<div class="card-header">
							<h5 class="card-title m-0">Featured</h5>
						</div>
						<div class="card-body">
							<h6 class="card-title">Special title treatment</h6>

							<p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
							<a href="#" class="btn btn-primary">Go somewhere</a>
						</div>
					</div>

					<div class="card card-primary card-outline">
						<div class="card-header">
							<h5 class="card-title m-0">Featured</h5>
						</div>
						<div class="card-body">
							<h6 class="card-title">Special title treatment</h6>

							<p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
							<a href="#" class="btn btn-primary">Go somewhere</a>
						</div>
					</div>
				</div>
			</div>
			<!-- /.col-md-6 -->
		</div>
		<!-- /.row -->
	</div><!-- /.container-fluid -->
</div>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<?= footer($data)?>