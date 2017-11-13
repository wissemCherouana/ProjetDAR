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
  
</head>
<body class="">
  <section class="vbox">
    <header class="bg-white-only header header-md navbar navbar-fixed-top-xs">
      <div class="navbar-header aside bg-info dk">
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
        <aside class="bg-black dk aside hidden-print" id="nav">          
          <section class="vbox">
            <section class="w-f-md scrollable" style="padding-bottom: 0px;">
              <div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="10px" data-railOpacity="0.2">
                


             <!-- nav -->                 
                <nav class="nav-primary hidden-xs">
                  <ul class="nav bg clearfix">
                    <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
                      Découvrez...
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
                </div>            </footer> </section>
        </aside>
        <!-- /.aside -->
        <section id="content">
          <section class="vbox">
            <section class="scrollable wrapper-lg" style="padding-bottom: 0px;">
              <div class="row">
                <div class="col-sm-9">
               <div class="row">
                <h1 class="col-sm-8" class="post-title" id="tvshowTitle" style="margin-top:0px!important"></h1>
                <div class="text-info padder m-t-sm text-sm" style="float:left; margin-top:20px!important" id="tvshowRateStars" >
                             
                </div>
                <h3  class="post-title" style="margin-top:15px!important; text-align:left!important" id="tvshowRate"></h3>
               </div>
                
                  <div class="blog-post">                   
                    <div class="post-item">
                      <div class="post-media">
                        <img id="tvshowPoster" class="img-full">
                      </div>
                      <div class="caption wrapper-lg" style="padding-top:20px!important;padding-bottom:0px!important">
                        <h3 class="post-title">Synopsis</h3>
                        <div class="post-sum">
                          <p id="tvshowSynopsis" style="text-align:justify" ></p>
                        </div>
                        
                      </div>
                     <div class="caption wrapper-lg" style="padding-top:0px!important; padding-bottom:0px!important"> 
                     <h3 style="padding-top:0px!important; padding-bottom:0px!important">Cast</h3></div>
                      <div class="row row-sm" style="padding-right:25px; padding-left:25px" id="cast" >
                      </div>
                      
                      <div class="caption wrapper-lg" style="padding-top:0px!important; padding-bottom:0px!important"> 
                     <h3 style="padding-top:0px!important; padding-bottom:0px!important">Saisons</h3></div>
                      <div class="row row-sm" style="padding-right:25px; padding-left:25px" id="seasons" >
                      </div>
                      
                      <div class="caption wrapper-lg" style="padding-top:0px!important; padding-bottom:0px!important">
                   		  <h3 class="post-title">Genres</h3>
                   		  <div style="margin-top:10px" class="tags m-b-lg l-h-2x" id="genres"></div>
                   	 </div>
                      
                      <div class="caption wrapper-lg"  style="padding-top:0px!important; font-size:18px" >
                   		  <i class="fa fa-clock-o"></i> Date de sortie : <span id="tvshowReleased" style="color:#336e7b" ></span>
                      </div>
                       
                     
                    </div>
                    
                    
                  </div> 
                </div>
                <div class="col-sm-3">
                 
				<h4>Bande annonce</h4>
                <div style="margin-right:20px!important" id="tvshowTrailer">
	                
				</div>
				
				 <div></div>
                  <h4>Suggestions</h4>
                  <div id="suggestions_tvshow">
                  </div>
                
                 
                </div>
                
              </div>
                 <div class="row">
              <div class="col-sm-9">
              <h4 class="m-t-lg m-b" id="comments_total"></h4>
                  <section class="comment-list block" id="tvshow_comments" >
                  </section>
                  <h4 class="m-t-lg m-b">Laisser une commentaire : </h4>
                  <form>
                    <div class="form-group">
                      <label>Commentaire</label>
                      <textarea class="form-control" id="content" name="content" rows="5" placeholder="Taper votre commentaire"></textarea>
                    </div>
                    <div class="form-group">
                      <button type="submit" onclick="addComment();return false;" class="btn btn-success">Envoyer le commentaire</button>
                    </div>
                  </form>
              </div>
              </div>
                 
              
            </section>
          </section>
          <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
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
  <script type="text/javascript" src="js/jPlayer/jquery.jplayer.min.js"></script>
  <script type="text/javascript" src="js/jPlayer/add-on/jplayer.playlist.min.js"></script>
  <script type="text/javascript" src="js/jPlayer/demo.js"></script>
  <script type="text/javascript" src="js/details_show.js"></script>
</body>
</html>