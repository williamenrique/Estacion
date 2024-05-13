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

				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.container-fluid -->
	</div>
	<!-- /.content-header -->

	<!-- Main content -->
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="card">
						<div class="card-header">
							<h5 class="card-title">Actualizar datos</h5>
						</div>
						<div class="card-body">
							<form class="" id="formDatos" name="formDatos" novalidate>
								<input type="hidden" name="textCi" id="textCi" value="<?= $_SESSION['userData']['user_ci']?>">
								<input type="hidden" name="textId" id="textId" value="<?= $_SESSION['userData']['user_id']?>">
								<input type="hidden" name="textEmail" id="textEmail" value="<?= $_SESSION['userData']['user_email']?>">
								<input type="hidden" name="opcion" id="opcion" value="1">
								<div class="row mb-3">
									<div class="col">
										<!-- <?= dep( $_SESSION['userData'])?> -->
										<h4>
											<span class="badge badge-info">
												<strong>
													<?php
																	if(empty($_SESSION['userData']['user_nick'])):
																		
																		echo 'No posee usuario';
																	else:
																	?><?= $_SESSION['userData']['user_nick']?>
												</strong>
											</span>
											<?php endif;?>
										</h4>
									</div>
									<div class="col">
										<h4>
											<span>Identificacion: </span>
											<span class="badge badge-info" id="userCi"><strong><?= $_SESSION['userData']['user_ci']?></strong>
											</span>
										</h4>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="form-row">
									<div class="col-md-6 mb-3">
										<label for="textNombres">Nombres</label>
										<input type="text" class="form-control" id="textNombres" name="textNombres" required
											value="<?= $_SESSION['userData']['user_nombres']?>">
										<div class="valid-feedback">
											Looks good!
										</div>
									</div>
									<div class="col-md-6 mb-3">
										<label for="textApellidos">Apellidos</label>
										<input type="text" class="form-control" id="textApellidos" name="textApellidos" required
											value="<?= $_SESSION['userData']['user_apellidos']?>">
										<div class="valid-feedback">
											Looks good!
										</div>
									</div>
								</div>
								<div class="form-row">
									<div class="col-md-6 mb-3">
										<label for="textTlf">Telefono</label>
										<input type="text" class="form-control" id="textTlf" name="textTlf" required
											value="<?= $_SESSION['userData']['user_tlf']?>">
										<div class="invalid-feedback">
											Please provide a valid city.
										</div>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-9 col-sm-9  ">
										<button type="submit" class="btn btn-success">Actualizar</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- /.col-md-6 -->
				<div class="col-lg-6">
					<div class="card">
						<div class="card-header">
							<h5 class="card-title m-0">Cambiar clave</h5>
						</div>
						<div class="card-body">
							<form class="" id="formPass" name="formPass" novalidate>
								<input type="hidden" name="textCi" id="textCi" value="<?= $_SESSION['userData']['user_ci']?>">
								<input type="hidden" name="textId" id="textId" value="<?= $_SESSION['userData']['user_id']?>">
								<input type="hidden" name="textEmail" id="textEmail" value="<?= $_SESSION['userData']['user_email']?>">
								<input type="hidden" name="opcion" id="opcion" value="3">
								<div class="row mb-3">
									<div class="col">
										<h4>
											<span class="badge badge-info">
												<strong>
													<?php
															if(empty($_SESSION['userData']['user_nick'])):
																
																echo 'No posee nick';
															else:
															?><?= $_SESSION['userData']['user_nick']?>
												</strong>
											</span>
											<?php endif;?>
										</h4>
									</div>
									<!-- <div class="col">
										<h4>
											<span>Identificacion: </span>
											<span class="badge badge-info"
												id="userCi"><strong><?= $_SESSION['userData']['user_ci']?></strong></span>
										</h4>
									</div> -->
									<div class="clearfix"></div>
								</div>
								<div class="form-row">
									<div class="col-md-6 mb-3">
										<label for="textPass">Password</label>
										<!-- <input type="password" class="form-control" id="textPass" name="textPass" required
																	value="<?= decryption($_SESSION['userData']['user_pass'])?>"> -->
										<input type="password" class="form-control" id="textPass" name="textPass" required>
										<div class="valid-feedback">
											Looks good!
										</div>
									</div>
									<div class="col-md-6 mb-3">
										<label for="textPassConfirm">Confirme Password</label>
										<input type="password" class="form-control" id="textPassConfirm" name="textPassConfirm">
										<div class="valid-feedback">
											Looks good!
										</div>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-9 col-sm-9  ">
										<button type="submit" class="btn btn-success">Cambiar password</button>
									</div>
								</div>
							</form>
						</div>
					</div>

					<!-- <div class="card card-primary card-outline">
						<div class="card-header">
							<h5 class="card-title m-0">Featured</h5>
						</div>
						<div class="card-body">
							<h6 class="card-title">Special title treatment</h6>
							<p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
							<a href="#" class="btn btn-primary">Go somewhere</a>
						</div>
					</div> -->
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