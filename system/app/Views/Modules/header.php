<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?= CSS ?>azia.css">
    <link href="<?= PLUGINS ?>css/ionicons.min.css" rel="stylesheet">
    <title>Estacion de servicio</title>
</head>
<body>
    <div class="az-header">
        <div class="container">
            <div class="az-header-left">
                <a href="index.html" class="az-logo"><span></span> E/S TACHIRA</a>
                <a href="" id="azMenuShow" class="az-header-menu-icon d-lg-none"><span></span></a>
            </div><!-- az-header-left -->
            <div class="az-header-menu">
                <div class="az-header-menu-header">
                    <a href="index.html" class="az-logo"><span></span> E/S TACHIRA</a>
                    <a href="" class="close">&times;</a>
                </div><!-- az-header-menu-header -->
                <ul class="nav">
                    <li class="nav-item active show">
                    <a href="index.html" class="nav-link"><i class="typcn typcn-chart-area-outline"></i> Dashboard</a>
                    </li>
                    <li class="nav-item">
                    <a href="" class="nav-link with-sub"><i class="typcn typcn-document"></i> Pages</a>
                    <nav class="az-menu-sub">
                        <a href="page-signin.html" class="nav-link">Sign In</a>
                        <a href="page-signup.html" class="nav-link">Sign Up</a>
                    </nav>
                    </li>
                    <li class="nav-item">
                    <a href="chart-chartjs.html" class="nav-link"><i class="typcn typcn-chart-bar-outline"></i> Charts</a>
                    </li>
                    <li class="nav-item">
                    <a href="form-elements.html" class="nav-link"><i class="typcn typcn-chart-bar-outline"></i> Forms</a>
                    </li>
                    <li class="nav-item">
                    <a href="" class="nav-link with-sub"><i class="typcn typcn-book"></i> Components</a>
                    <div class="az-menu-sub">
                        <div class="container">
                        <div>
                            <nav class="nav">
                            <a href="elem-buttons.html" class="nav-link">Buttons</a>
                            <a href="elem-dropdown.html" class="nav-link">Dropdown</a>
                            <a href="elem-icons.html" class="nav-link">Icons</a>
                            <a href="table-basic.html" class="nav-link">Table</a>
                            </nav>
                        </div>
                        </div><!-- container -->
                    </div>
                    </li>
                </ul>
            </div><!-- az-header-menu -->

            <div class="az-header-right">
               
                <div class="az-header-message">
                    <a href="#"><i class="typcn typcn-messages"></i></a>
                </div><!-- az-header-message -->
                
                <div class="dropdown az-profile-menu">
                    <a href="" class="az-img-user"><img src="<?= IMG ?>face1.jpg" alt=""></a>
                    <div class="dropdown-menu">
                    <div class="az-dropdown-header d-sm-none">
                        <a href="" class="az-header-arrow"><i class="icon ion-md-arrow-back"></i></a>
                    </div>
                    <div class="az-header-profile">
                        <div class="az-img-user">
                        <img src="<?= IMG ?>face1.jpg" alt="">
                        </div><!-- az-img-user -->
                        <h6><?= $_SESSION['userData']['user_nombres']?></h6>
                        <span><?= $_SESSION['userData']['rol_name']?></span>
                    </div><!-- az-header-profile -->
                    <a href="" class="dropdown-item"><i class="typcn typcn-edit"></i> Edit Perfil</a>
                    <a href="<?= base_url()?>logout" class="dropdown-item"><i class="typcn typcn-power-outline"></i>SALIR</a>
                    </div><!-- dropdown-menu -->
                </div>
            </div><!-- az-header-right -->
        </div><!-- container -->
    </div><!-- az-header -->