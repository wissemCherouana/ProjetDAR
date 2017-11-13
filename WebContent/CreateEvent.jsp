<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import ="DAO.CinephileDAO" %> 
   <%@ page import ="Beans.Cinephile" %> 
<!DOCTYPE html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>DCinephilia | Réseau social des cinéphiles</title>
  <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <link rel="stylesheet" href="js/jPlayer/jplayer.flat.css" type="text/css" />
  <link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
  <link rel="stylesheet" href="css/animate.css" type="text/css" />
  <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
  <link rel="stylesheet" href="css/simple-line-icons.css" type="text/css" />
  <link rel="stylesheet" href="css/font.css" type="text/css" />
  <link rel="stylesheet" href="css/app.css" type="text/css" />
  <link rel="stylesheet" href="css/style_card.css" type="text/css" />  
  <link rel="stylesheet" href="css/easy-autocomplete.css" type="text/css" />  
  <link rel="stylesheet" href="css/easy-autocomplete.min.css" type="text/css" />  
  <link rel="stylesheet" href="css/easy-autocomplete.themes.css" type="text/css" />  
  <link rel="stylesheet" href="css/easy-autocomplete.themes.min.css" type="text/css" />  
</head>
<body class="">
  <section class="vbox">
    <header class="bg-white-only header header-md navbar navbar-fixed-top-xs">
      <div class="navbar-header aside bg-info nav-xs">
        <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen,open" data-target="#nav,html">
          <i class="icon-list"></i>
        </a>
        <a href="Home.jsp" class="navbar-brand text-lt">
          <i class="icon-film"></i>
          <img src="images/logo.png" alt="." class="hide">
          <span class="hidden-nav-xs m-l-sm" style="font-family: 'CollegeMovie'; font-size: 30px; font-weight: normal;">DCinephilia</span>
        </a>
        <a class="btn btn-link visible-xs" data-toggle="dropdown" data-target=".user">
          <i class="icon-settings"></i>
        </a>
      </div>      <ul class="nav navbar-nav hidden-xs">
        <li>
          <a href="#nav,.navbar-header" data-toggle="class:nav-xs,nav-xs" class="text-muted">
            <i class="fa fa-indent text"></i>
            <i class="fa fa-dedent text-active"></i>
          </a>
        </li>
      </ul>
      <form class="navbar-form navbar-left input-s-lg m-t m-l-n-xs hidden-xs">
        <div class="form-group">
          <div class="input-group">
            <span class="input-group-btn">
              <button type="submit" onclick="SearchEvent();return false;" class="btn btn-sm bg-white btn-icon rounded"><i class="fa fa-search"></i></button>
            </span>
            <input type="text" id="search_keywords" class="form-control input-sm no-border rounded" placeholder="Chercher film, série...">
          </div>
        </div>
      </form>
      <div class="navbar-right ">
        <ul class="nav navbar-nav m-n hidden-xs nav-user user">
          <li class="hidden-xs">
            <a href="#" class="dropdown-toggle lt" data-toggle="dropdown">
              <i class="icon-bell"></i>
              <span class="badge badge-sm up bg-danger count">2</span>
            </a>
            <section class="dropdown-menu aside-xl animated fadeInUp">
              <section class="panel bg-white">
                <div class="panel-heading b-light bg-light">
                  <strong>You have <span class="count">2</span> notifications</strong>
                </div>
                <div class="list-group list-group-alt">
                  <a href="#" class="media list-group-item">
                    <span class="pull-left thumb-sm">
                      <img src="images/a0.png" alt="..." class="img-circle">
                    </span>
                    <span class="media-body block m-b-none">
                      Use awesome animate.css<br>
                      <small class="text-muted">10 minutes ago</small>
                    </span>
                  </a>
                  <a href="#" class="media list-group-item">
                    <span class="media-body block m-b-none">
                      1.0 initial released<br>
                      <small class="text-muted">1 hour ago</small>
                    </span>
                  </a>
                </div>
                <div class="panel-footer text-sm">
                  <a href="#" class="pull-right"><i class="fa fa-cog"></i></a>
                  <a href="#notes" data-toggle="class:show animated fadeInRight">See all the notifications</a>
                </div>
              </section>
            </section>
          </li>
          <li class="dropdown">
            <a style="cursor:pointer" class="dropdown-toggle bg clear" data-toggle="dropdown">
              <span class="thumb-sm avatar pull-right m-t-n-sm m-b-n-sm m-l-sm">
                <img src="images/a0.png" alt="...">
              </span>
              <% 
				CinephileDAO cinephile_dao = new CinephileDAO();
				Cinephile cinephile = cinephile_dao.GetCinephileById(Integer.valueOf(String.valueOf(session.getAttribute("id_cinephile")))); 
				pageContext.setAttribute("username", cinephile.getUsername());
				%>
              	${username}<b class="caret"></b>
            </a>

            <ul class="dropdown-menu animated fadeInRight">            
              <li>
                <a id="click_profile">Profile</a>
              </li>
              <li class="divider"></li>
              <li>
                <a onclick="Logout();return false;" style="cursor:pointer" data-toggle="ajaxModal" >Déconnexion</a>
              </li>
            </ul>
          </li>
        </ul>
      </div>      
    </header>
    <section>
      <section class="hbox stretch">
        <!-- .aside -->
        <aside class="bg-black dk nav-xs aside hidden-print" id="nav">          
          <section class="vbox">
            <section class="w-f-md scrollable">
              <div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="10px" data-railOpacity="0.2">
                


                <!-- nav -->                 
                <nav class="nav-primary hidden-xs">
                  <ul class="nav bg clearfix">
                    <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
                    <div class="input-group">
		            <span class="input-group-btn">
		              <button type="submit" onclick="SearchCinephileEvent();return false;" class="btn btn-sm bg-empty no-border btn-icon"><i class="fa fa-search"></i></button>
		            </span>
           			 <input type="text" id="search_cinephile" class="form-control input-sm text-white bg-empty  b-b b-dark no-border" placeholder="Search members"></div>  
                    </li>
                    <li>
                      <a href="index.html">
                        <i class="icon-social-youtube icon text-success"></i>
                        <span class="font-bold">Les nouveautés</span>
                      </a>
                    </li>
                    <li>
                      <a href="MoviesByGenre.jsp?id_genre=28">
                        <i class="icon-list icon text-info"></i>
                        <span class="font-bold">Genres</span>
                      </a>
                    </li>
                    <li>
                      <a href="listen.html">
                        <i class="icon-user-follow icon  text-primary-lter"></i>
                        <span class="font-bold">Chercher profile</span>
                      </a>
                    </li>
                    <li>
                      <a href="events.html">
                        <i class="icon-calendar icon text-success"></i>
                        <b class="badge bg-success pull-right">6</b>
                        <span class="font-bold">Evénements</span>
                      </a>
                    </li>
                    
                    <li>
                      <a href="listen.html">
                        <i class="icon-clock icon  text-info"></i>
                        <span class="font-bold">Séances films</span>
                      </a>
                    </li>
                    <li>
                      <a href="video.html" data-target="#content" data-el="#bjax-el" data-replace="true">
                        <i class="fa fa-map-marker icon  text-warning"></i>
                        <span class="font-bold">Cinémas de l'IDF</span>
                      </a>
                    </li>
                    <li class="m-b hidden-nav-xs"></li>
                  </ul>
                 <ul class="nav text-sm">
                    <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
                      <span class="pull-right"><a href="#"><i class="icon-plus i-lg"></i></a></span>
                      Mes listes
                    </li>
                    <li>
                      <a href="#">
                        <i class="icon-music-tone icon"></i>
                        <span>Hip-Pop</span>
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <i class="icon-music-tone icon"></i>
                        <span>Hip-Pop</span>
                      </a>
                    </li>
                  </ul>
                </nav>
                <!-- / nav -->
              </div>
            </section>
            
            <footer class="footer hidden-xs no-padder text-center-nav-xs">
              <div class="bg hidden-xs ">
                  <div class="dropdown dropup wrapper-sm clearfix">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <span class="thumb-sm avatar pull-left m-l-xs">                        
                        <img src="images/a3.png" class="dker" alt="...">
                        <i class="on b-black"></i>
                      </span>
                      <span class="hidden-nav-xs clear">
                        <span class="block m-l">
                          <strong class="font-bold text-lt">${username}</strong> 
                          <b class="caret"></b>
                        </span>
                      </span>
                    </a>
                    <ul class="dropdown-menu animated fadeInRight aside text-left">                      

                      <li>
                        <a id="click_profile">Profile</a>
                      </li>
                      <li>
                         <a onclick="Logout();return false;" style="cursor:pointer" data-toggle="ajaxModal" >Déconnexion</a>
                      </li>
                    </ul>
                  </div>
                </div>            </footer>
          </section>
        </aside>
        <!-- /.aside -->
        <section id="content">
          <section class="hbox stretch">
            <section>
              <section class="vbox">
                <section class="scrollable padder-lg w-f-md" id="bjax-target" style="bottom:0px">
                  <div class="row" style="margin-top:20px">
                  <div class="col-sm-12">
                  <section class="panel panel-default">
                    <header class="panel-heading font-bold">Création d'une rencontre entre cinéphiles</header>
                    <div class="panel-body">
                      <form class="bs-example form-horizontal">
                      <div class="col-sm-6">
                        <div class="form-group">
                         
                          <div class="col-lg-11">
                            <input type="text" class="form-control" placeholder="Titre" id="title" name="title" >
                          </div>
                        </div>
                        
                        
                        <div class="form-group">
                         
                          <div class="col-lg-11">
                            <textarea rows="4" class="form-control" placeholder="Description" id="description" name="description"></textarea>
          				</div>
                        </div>
                        
                         <div class="form-group">
                          <div class="col-lg-offset-2 col-lg-10">
                            <button type="submit" onclick="seeCinemas();return false;"class="btn btn-sm btn-default">Regarder les cinémas de l'île-de-France</button>
                          </div>
                        </div>
                        
                        </div>
                      <div class="col-sm-6">
                      <div class="form-group">
                          
                          <div class="col-lg-11">
                            <select type="text" class="form-control" placeholder="Séance" id="date" name="date">
                            </select>
                          </div>
                        </div>
                         <div class="form-group">
                          
                          <div class="col-lg-11">
                            <input type="text" class="form-control" placeholder="Lieu de la rencontre" id="place" name="place" >
                          </div>
                        </div>
                        
                                               
                        <div class="form-group">
                         
                          <div class="col-lg-11">
                            <input type="text" class="form-control" placeholder="Nombre maximal de participants" id="limit" name="limit">
                          </div>
                        </div>
                        
                         <div class="form-group">
                          <div class="col-lg-offset-2 col-lg-10">
                            <button type="submit" onclick="sendEvent();return false;"class="btn btn-sm btn-default">Créer un événement de rencontre</button>
                          </div>
                        </div>
                        
                        </div>
                      
                      </form>
                   
                    </div>
                  </section>
                </div>
                  </div>
                  <div class="row m-t-lg m-b-lg">
                  <div class="col-sm-6">
                      <div class="wrapper-md r" style="background-color:#0078bb; color:white!important">
                        <a href="https://bitbucket.org/Sbenalla/cinephiledar">
                          <span class="h4 m-b-xs block" style="color:white"><i class="icon-cloud-download i-lg">  </i> Rapport</span>
                          <span class="text-muted" style="color:#ddd" >Télécharger le rapport et le manuel d'utilisation</span>
                        </a>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="wrapper-md r" style="background-color:#2b3137; color:white!important">
                        <a href="https://bitbucket.org/Sbenalla/cinephiledar">
                          <span class="h4 m-b-xs block" style="color:white"><i class="fa fa-github i-lg">  </i> Code source</span>
                          <span class="text-muted" style="color:#ddd" >Voir le code source sur Github.</span>
                        </a>
                      </div>
                    </div>
                  </div>
                <!-- footer -->
				  <footer id="footer">
				    <div class="text-center padder clearfix">
				      <p>
				        <small>DCinephila - Réseau social pour les cinéphiles<br>&copy; 2017</small>
				      </p>
				    </div>
				  </footer>
				  <!-- / footer -->
                </section>
              </section>
            </section>
            <!-- side content -->
           <!-- / side content -->
          </section>
         </section>
      </section>
    </section>    
  </section>
 
  <script src="js/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="js/bootstrap.js"></script>
  <!-- App -->
  <script src="js/app.js"></script>  
  <script src="js/slimscroll/jquery.slimscroll.min.js"></script>
  <script src="js/app.plugin.js"></script>
  <script src="js/jquery.easy-autocomplete.js" type="text/javascript"></script>
  <script src="js/jquery.easy-autocomplete.min.js" type="text/javascript"></script>
  <script src="js/cinemas.js" type="text/javascript"></script>
</body>
</html>