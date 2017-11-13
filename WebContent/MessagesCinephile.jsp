<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="DAO.CinephileDAO" %> 
   <%@ page import ="Beans.Cinephile" %> 
<!DOCTYPE html">
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
<body  class="">
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
           			 <input type="text" id="search_cinephile" class="form-control input-sm text-white bg-empty  b-b b-dark no-border" placeholder="Chercher un cinéphile"></div>  
                    </li>
                    <li>
                      <a href="MoviesByGenre.jsp?id_genre=28">
                        <i class="icon-social-youtube icon text-success"></i>
                        <span class="font-bold">Films par genre</span>
                      </a>
                    </li>
                    <li>
                      <a href="MessagesCinephile.jsp">
                        <i class="fa fa-comment text-primary-lter"></i>
                        <span class="font-bold">Mes messages</span>
                      </a>
                    </li>
                    
                    <li>
                      <a href="Seances.jsp">
                        <i class="icon-clock icon  text-info"></i>
                        <span class="font-bold">Séances films</span>
                      </a>
                    </li>
                    
                    <li>
                      <a href="MapCinemasIleDeFrance.jsp" data-target="#content" data-el="#bjax-el" data-replace="true">
                        <i class="fa fa-map-marker icon  text-warning"></i>
                        <span class="font-bold">Cinémas de l'IDF</span>
                      </a>
                    </li>
                    
                    <li>
                      <a href="Events.jsp">
                        <i class="icon-calendar icon text-success"></i>
                        <b class="badge bg-success pull-right">6</b>
                        <span class="font-bold">Evénements</span>
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
                          <strong class="font-bold text-lt"></strong> 
                          <b class="caret"></b>
                        </span>
                        <span class="text-muted text-xs block m-l">Art Director</span>
                      </span>
                    </a>
                    <ul class="dropdown-menu animated fadeInRight aside text-left">                      
                      <li>
                        <span class="arrow bottom hidden-nav-xs"></span>
                        <a href="#">Settings</a>
                      </li>
                      <li>
                        <a href="profile.html">Profile</a>
                      </li>
                      <li>
                        <a href="#">
                          <span class="badge bg-danger pull-right">3</span>
                          Notifications
                        </a>
                      </li>
                      <li>
                        <a href="docs.html">Help</a>
                      </li>
                      <li class="divider"></li>
                      <li>
                        <a href="modal.lockme.html" data-toggle="ajaxModal" >Logout</a>
                      </li>
                    </ul>
                  </div>
                </div>            </footer>
          </section>
        </aside>
        <!-- /.aside -->
        <section id="content">
          <section class="vbox">
            <section class="scrollable">
              <section class="hbox stretch">
                <aside class="aside-lg bg-light lter b-r">
                  <section class="vbox">
                    <section class="scrollable">
                   <section class="panel panel-default">
                        <header class="panel-heading bg-light no-border">
                          <div class="clearfix">
                            <a href="#" class="pull-left thumb-md avatar b-3x m-r">
                              <img src="images/a1.png" alt="...">
                            </a>
                            <div class="clear">
                              <div class="h3 m-t-xs m-b-xs">
                                ${username}
                                <i class="fa fa-circle text-success pull-right text-xs m-t-sm"></i>
                              </div>
                              <small class="text-muted">Messagerie</small>
                            </div>
                          </div>
                        </header>
                        <div class="list-group no-radius alt" id="cinephiles">
                          
                          
                        </div>
                      </section>
                   </section>
                   
                  </section>
                  
                </aside>
                <aside class="bg-white">
                  <section class="vbox">
                             <!-- chat -->
                  <section class="panel panel-default" >
                    <header class="panel-heading">Chat</header>
                    <section class="chat-list panel-body slim-scroll" data-height="400px" id="chat" >
                    
                                               
                    </section>
                    <footer class="panel-footer">
                      <!-- chat form -->
                      <article class="chat-item" id="chat-form">
                        <a class="pull-left thumb-sm avatar"><img src="images/a3.png" class="img-circle" alt="..."></a>
                        <section class="chat-body">
                          <form class="m-b-none">
                            <div class="input-group">
                              <input type="text" id="message" class="form-control" placeholder="Dites quelques choses...">
                              <span class="input-group-btn">
                                <button class="btn btn-default" onclick="sendMessage();return false;" type="button">Envoyer</button>
                              </span>
                            </div>
                          </form>
                        </section>
                      </article>
                    </footer>
                  </section>
                  <!-- /chat --> 
                  
                  </section>
                </aside>
             
              </section>
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
  <script src="js/charts/easypiechart/jquery.easy-pie-chart.js"></script>
  <script src="js/app.plugin.js"></script>
  <script type="text/javascript" src="js/jPlayer/jquery.jplayer.min.js"></script>
  <script type="text/javascript" src="js/jPlayer/add-on/jplayer.playlist.min.js"></script>
  <script type="text/javascript" src="js/jPlayer/demo.js"></script>
  <script type="text/javascript" src="js/cinephile.js"></script>
  <script type="text/javascript" src="js/profile.js"></script>

 <script type="text/javascript">
  
  $(document).ready(function(){
		GetEvents(); 
		GetMessages(); 
		
	});
  
  function GetEvents()
  {
	  
  	$.ajax({
  		type: "GET",
  		url : "ConsultMessages",
  		dataType : 'json',
  		success : function(data) {
  			if (data.response==200)
  			{
  				
  				var events = data.cinephiles;
  				console.log(events);
  				if(events.length == 0)
  				{
  					console.log("la liste contient 0 items"); 
  				} 
  				else 
  				{
  					for(i=0; i<events.length; i++)
  						{
  							console.log(events[i].username);
  							DisplayCinephile(events[i]); 
  						}
  				}
  			}
  			
  		},
  		error : function(XHR, testStatus, errorThrown) 
  		{
  			console.log("status: " + XHR.status + ", erreur: " + XHR.responseText);
  		}
  	});
  }
  
  function DisplayCinephile(cinephile)
  {
	  var DivCinephile; 
	  if (GetURLParameter('id_other')==cinephile.id)
	  DivCinephile = '<a class="list-group-item" style="cursor:pointer; background-color:#f3f5f7" onClick="SeeMessages('+cinephile.id+')"><i class="fa fa-comment icon-muted" style="margin-right:10px"></i>'+cinephile.username+'</a>'; 
	  else DivCinephile = '<a class="list-group-item" style="cursor:pointer" onClick="SeeMessages('+cinephile.id+')"><i class="fa fa-comment icon-muted" style="margin-right:10px"></i>'+cinephile.username+'</a>'; 
	  var DivMessages = $("#cinephiles");
	  DivMessages.append(DivCinephile); 
  }
  
  function SeeMessages(id)
  {
	  window.location=('MessagesCinephile.jsp?id_other='+id);
  }
  

  function sendMessage() {
  	var content= $('#message').val();
  	//alert(content);
  	var id_receiver = GetURLParameter('id_other');
  	SaveMessage(id_receiver,content);

  }
  //penser à regler la jsp de l'affichage des msg apres envoie
  function SaveMessage(id_receiver,content) {
  	console.log("send to AddCommentServlet");
  	$.ajax({
  		type : "POST",
  		url : "AddMessage",
  		data : {
  			"id_other" : id_receiver,
  			"content" : content
  		},
  		dataType : "json",
  		success : function(data) {
  			var resultat=data;
  			if (resultat.response==200)
  			{			
  				DisplayNewMessage(data);	
  				$('#message').val("");
  			}
  		},
  		error : function(XHR, testStatus, errorThrown) {
  			console.log("status: " + XHR.status + ", erreur: "
  					+ XHR.responseText);
  		}
  	});
  }

  function DisplayMyMessage(message)
  {
  	var date = new Date(message.date);
  	var displayDate = formatAMPM(date);
  	
  	var DivChat = $("#chat"); 
  	var DivMine = '<article id="chat-id-2" class="chat-item right" style="border-left-color: #36b0c8!important;"><a href="#" class="pull-right thumb-sm avatar">'+
  		'<img src="images/female.png" class="img-circle" alt="..."></a><section class="chat-body"><div class="panel bg-light text-sm m-b-none" style="    background-color: #36b0c8; color: #fff;" >'+
  		'<div class="panel-body"><span class="arrow right" style="border-left-color: #36b0c8!important;"></span><p class="m-b-none">'+message.content+'</p></div></div>'+
          '<small class="text-muted">'+displayDate+'</small></section></article> '; 
  	DivChat.append(DivMine); 
  	
  }

  function DisplayNewMessage(message)
  {
  	var date = new Date();
  	var displayDate = formatAMPM(date);
  	
  	var DivChat = $("#chat"); 
  	var DivMine = '<article id="chat-id-2" class="chat-item right" style="border-left-color: #36b0c8!important;"><a href="#" class="pull-right thumb-sm avatar">'+
  		'<img src="images/female.png" class="img-circle" alt="..."></a><section class="chat-body"><div class="panel bg-light text-sm m-b-none" style="    background-color: #36b0c8; color: #fff;" >'+
  		'<div class="panel-body"><span class="arrow right" style="border-left-color: #36b0c8!important;"></span><p class="m-b-none">'+message.content+'</p></div></div>'+
          '<small class="text-muted">'+displayDate+'</small></section></article> '; 
  	DivChat.append(DivMine);  
  	
  }

  function DisplayMessageOther(message)
  {
  	var date = new Date(message.date);
  	var displayDate = formatAMPM(date);
  	
  	var DivChat = $("#chat"); 
  	var DivOther = '<article id="chat-id-1" class="chat-item left"><a href="#" class="pull-left thumb-sm avatar">'
  		+'<img src="images/female.png" alt="..."></a><section class="chat-body"><div class="panel b-light text-sm m-b-none">'+
            '<div class="panel-body"><span class="arrow left"></span><p class="m-b-none">'+message.content+'</p></div></div>'+
          '<small class="text-muted"><i class="fa fa-ok text-success"></i>'+displayDate+'</small></section></article>'; 
  	DivChat.append(DivOther); 
  	
  }

  function GetMessages()
  {
  	id_receiver = GetURLParameter('id_other'); 
  	$.ajax({
  		type: "GET",
  		url : "DisplayMessagesBetweenTwoCinephiles",
  		dataType : 'json',
  		data : {
  			"id_other" : id_receiver
  			},
  		success : function(data) {

  			var resultat = data;
  			if (resultat.response==200)
  			{
  				
  				var messages = resultat.messages.sort(function(a, b) {
  				    return new Date(a.date).getTime() - new Date(b.date).getTime();
  				});
  				for(i=0; i<messages.length; i++)
  				{
  					if (messages[i].status=="sent") DisplayMyMessage(messages[i]);
  					else DisplayMessageOther(messages[i]);
  				}	
  				
  				
  			}
  		},
  		error : function(XHR, testStatus, errorThrown) 
  		{
  			console.log("status: " + XHR.status + ", erreur: " + XHR.responseText);
  		}
  	});
  }

  function formatAMPM(date) { 
  	  var hours = date.getHours();
  	  var minutes = date.getMinutes();
  	  minutes = minutes < 10 ? '0'+minutes : minutes;
  	  hours = hours == 0 ? '0'+hours : hours; 
  	  var strTime = hours + ':' + minutes;
  	  return displayDate = date.getDate()+ '-' + (date.getMonth()+1)+'-' +date.getFullYear()+ ' ' +strTime;;
  	}

  	
  	
  	
  function GetURLParameter(sParam)
  {
  	var sPageURL = window.location.search.substring(1);
  	var sURLVariables = sPageURL.split('&');
  	for (var i = 0; i < sURLVariables.length; i++)
  	{
  		var sParameterName = sURLVariables[i].split('=');
  		if (sParameterName[0] == sParam)
  		{
  			return sParameterName[1];
  		}
  	}
  }

  
  </script>

</body>
</html>