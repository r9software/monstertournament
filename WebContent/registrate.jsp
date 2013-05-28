<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="util.ArregloDeDatos,java.util.ArrayList,java.util.List"
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<title>Monster Tournament</title>

<link href="http://fonts.googleapis.com/css?family=Oswald:400,700,300" rel="stylesheet" type="text/css" />
<!-- Included CSS Files -->
<link rel="stylesheet" href="stylesheets/main.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="stylesheets/devices.css" type="text/css" media="screen" title="no title" charset="utf-8"  />
<link rel="stylesheet" href="stylesheets/post.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="stylesheets/validationEngine.jquery.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="stylesheets/jquery.fancybox.css?v=2.1.2" type="text/css"  media="screen" />
<!--[if IE ]>
<link rel="stylesheet" href="stylesheets/ie.css"> 
<![endif]-->
</head>

<body>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/es_ES/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<!--********************************************* Main wrapper Start *********************************************--> 
<div id="footer_image">
<div id="main_wrapper">

    <!--********************************************* Logo Start *********************************************-->
    <div id="logo"> <a href="#"><img alt="alt_example" src="./images/logo.png"  /></a>
      <div id="social_ctn"> 
      
      <a class="social_t"><img alt="alt_example" src="./images/social_tleft.png" /></a> 
  
      <a href="#" id="rss"><img alt="alt_example" src="./images/blank.gif" width="100%" height="37px" /></a> 
      <a href="#" id="facebook"><img alt="alt_example" src="./images/blank.gif" width="100%" height="37px" /></a> 
      <a href="#" id="twitter"><img alt="alt_example" src="./images/blank.gif" width="100%" height="37px" /></a>  
      <a href="#" id="google_plus"><img alt="alt_example" src="./images/blank.gif" width="100%" height="37px" /></a>
      <a href="#" id="you_tube"><img alt="alt_example" src="./images/blank.gif" width="100%" height="37px" /></a> 
    
      <a class="social_t" ><img alt="alt_example" src="./images/social_tright.png" /></a> 
      
      </div>
    
    </div>
    <!--********************************************* Logo end *********************************************--> 
    
    <!--********************************************* Main_in Start *********************************************-->
    <div id="main_in">  
      
    <!--********************************************* Mainmenu Start *********************************************-->
    <div id="menu_wrapper">
      <div id="menu_left"></div>
      <ul id="menu">
      <% 
					if(session.getAttribute("nombreUsuario")==null){ 
					
						System.out.println(session.getAttribute("nombreUsuario"));
					%>
					
					<li><a href="index.jsp">Conectate</a>
					</li>
					
						<li><a href="registrate.jsp">Registrate</a></li>
					<%}
					else{ %>
						<li ><a href="ServletPortada?id=<%out.print(session.getAttribute("idUsuario")); %>"><%out.print(session.getAttribute("nombreUsuario")); %></a></li>
						<li ><a href="ServletPortada?logout=true"><%out.print("Cerrar Sesion"); 
						response.sendRedirect("ServletPortada?id="+session.getAttribute("idUsuario"));
						%></a>
						</li>
						<% 
					}
					%>	
        <!---
        <li><a href="./index.html">Home</a></li>
        <li><a href="./banner2.html">Second banner</a></li>
        <li><a>Dropdown</a>
        	<ul>
                <li><a href="#">Submenu example 1</a></li>
                <li><a href="#">Submenu example 2</a></li>
                <li><a href="#">Submenu example 3</a></li>
                <li class="drop_last"><a href="#" >Submenu example 4</a></li>
            </ul>
        </li>
        <li><a href="./post_list.html">post list</a></li>
        <li><a href="./post.html">Post</a></li>
        <li><a href="./post_game.html">Post with game</a></li>
        <li><a href="./full_page.html">Full page</a></li>
        <li><a href="./gallery.html">Gallery</a></li>
        <li><a href="./contact.html">Contact</a></li>-->
      </ul>
        <a href="#" id="pull">Menu</a>
      <div id="menu_right"></div>
      <div class="clear"></div>
    </div>
    
    <!--********************************************* Mainmenu end *********************************************--> 
        
        

     <!--********************************************* Main start *********************************************-->
     <div id="main_news_wrapper">
 
       <div id="row"> 
       <!-- Left wrapper Start -->
        <div id="left_wrapper">
                <div class="header">
                	<h2><span>MonsterTournament</span> <a href="./post_list.html">Registrate</a></h2>
                </div>
                 
                <div id="post_wrapper">
                
                    <!-- Leave a response Start -->
                    <div id="response" class="contact_form">
                    	
                        	<h1 class="title">Registrate para Ingresar</h1>
                            <form id="form" action="ServletRegistrarse" method= "get" autocomplete="on" name="f1"> 
                                <div class="info-box"> 
                                <h5> 
                                    <label for="usernamesignup" class="uname" data-icon="u">Nombre de usuario</label></h5>
                                    <input id="usernamesignup" name="usuario" required="required" type="text" placeholder="mysuperusername690" />
                                </div>
                                <div class="info-box"> 
                                <h5>
                                    <label for="emailsignup" class="youmail" data-icon="e" >Email</label></h5>
                                    <input id="emailsignup" name="email" required="required" type="email" placeholder="mysupermail@mail.com"/> 
                                </div>
                                <div class="info-box"> 
                                <h5> 
                                    <label for="passwordsignup" class="youpasswd" data-icon="p">Contrase&ntilde;a </label></h5>
                                    <input id="password" name="pas" required="required" type="password" placeholder="eg. X8df!90EO" onkeyup="javascript:checar()">
                                </div>
                                 <!-- -                               <div class="info-box"> 
                                <h5> 
                                    <label for="passwordsignup" class="youpasswd" data-icon="p">Repetir contrase&ntilde;a </label></h5>
                                    <input id="password2" name="pas2" required="required" type="password" placeholder="eg. X8df!90EO" onkeyup="javascript:checar()">
                                </div>
                                 
                                 <div class="info-box"> 
                                <img name="imagen" src="no.png" width="50px" height="50px">
                                </div>
                                -->
                                <div class="info-box"> 
                                <h5> 
                                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="u">Nombre </label></h5>
                                    <input id="usernamesignup" name="nombre" required="required" type="text" placeholder="Tu gran nombre"/>
                                </div>
                                <div class="info-box"> 
                                <h5> 
                                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="u">Apellidos </label></h5>
                                    <input id="usernamesignup" name="apellidos" required="required" type="text" placeholder="Tu Apellido"/>
                                </div>
                               <!-- 
                                <div class="info-box"> 
                                <h5> 
                                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="u">Imagen de Perfil</label></h5>
                                  </div>
                                   -->
                                <div class="info-box"> 
                                <h5>
                                <img src='captcha.jsp' width=200 height=50><br>
                                <label for="usernamesignup" class="uname" data-icon="u">Introduce el codigo </label></h5>
                                    <input id="usernamesignup" name="captcha" required="required" type="text" placeholder="Introduce el Captcha"/>
                                </div>
                                <a class="button purple" style="opacity: 1; " > 
                                <input type="submit" value="Enviar"> 
                                </a>
                                <p class="change_link">  
									&iquest;Ya estas registrado?
									<a href="index.jsp"> Inicia Sesion </a>
								</p>
                            </form>
                        
                    </div>
                    <!-- Leave a response end -->  
                    
                    
                    <div class="clear"></div>
               </div> 
            </div>
            <!-- Left wrapper end -->
            
            <!-- Right wrapper Start -->
            <div id="right_wrapper">
        	
            
            
                
               <div class="normal">
                   <div class="header"><a href="#">Unete en facebook!</a></div>
                   <div class="body"><div class="fb-like-box" style="border:none; overflow:hidden; width:300px; height:290px;" data-href="https://www.facebook.com/konami" data-width="292" data-show-faces="true" data-stream="true" data-show-border="true" data-header="true"></div>
                   </div>
               </div>
                
       	    <!-- Right wrapper end -->
             </div>
      	<div class="clear"></div>
        
        </div>
      </div>
    
    <div class="bottom_shadow"></div>
  
    <!--********************************************* Main end *********************************************--> 
    
    <!--********************************************* Main advert start *********************************************-->
    <div class="main_advert">
      <a href="http://themeforest.net/user/Skywarrior" target="_blank"><img alt="alt_example" src="./images/main_ad.png" border="0" /></a>
      
    </div>
    <!--********************************************* Main advert end *********************************************--> 

    <!--********************************************* Footer start *********************************************-->
     <div id="footer">
    <div class="row">
      <div class="footer_widget">
        <div class="header"><a href="#">Acerca de Monster Tournament</a></div>
        <div class="body">
          <p><img alt="alt_example" src="./images/about_img.png" align="left" style="margin:0px 15px 5px 0px;"  />Monster Tournament, es un sitio donde podras encontrar a gamers como tu dispuestos
          a demostrar quien es el mejor en su juego, organiza torneos y guerras de clanes, ademas compite por premios y mucho m&aacute;s.
          Disfruta compitiendo.</p>
          <img alt="alt_example" src="./images/orizon_about.png" style="margin:11px 0px 0px 55px;"/></div>
      </div>
      <div class="divider_footer"></div>
      <div id="latest_media">
        <div class="header"><a href="#">Mejores Juegos</a></div>
        <div class="body">
        <%
        String regex="-*$#*-";
        List<String> imagenes= new ArrayList<String>();
        imagenes=ArregloDeDatos.ImagenesPie;
		if(imagenes.size()>0)
		{
        	%>
          <ul id="l_media_list">
          <%
          for(int x=0;x<imagenes.size();x++)
          {
         String[] datos= imagenes.get(x).split(regex);
         System.out.println(imagenes.get(x));
         String idjuego=datos[0];
         String nombre= datos[1];
         
          %>
            <li><a class="shadowbox" href="ServletJuego?id=<%out.print(idjuego);%>" rel="gallery" ><img alt="<%out.print(nombre);%>" src="system/juego/<%out.print(idjuego);%>-2.jpg" height="204px" height="166px" /></a></li>
            <%
            }
          	%>
          </ul>
        <%   
		}
		 %>  
        </div>
      </div>   
      <div class="clear"></div>
    </div>
    </div>
    <!--********************************************* Footer end *********************************************--> 
    <div class="clear"></div>
    <!--********************************************* Twitter feed start *********************************************-->
    <div id="twitter_last"> <a id="tr_left" href="#"><img alt="alt_example" src="./images/blank.gif" width="100%" height="30px" border="0" /></a>
      <div id="tr_right">
        <ul id="tw">
        </ul>
      </div>
    </div>
    <!--********************************************* Twitter feed end *********************************************--> 

     </div>
<!--********************************************* Main_in Start *********************************************--> 
     
     <a id="cop_text" href="http://www.facebook.com/r9software">Developed by R9software </a>
     
	</div>
</div>
<!--********************************************* Main wrapper end *********************************************--> 

<script src="http://code.jquery.com/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="./javascript/getTweet.js" type="text/javascript" ></script>
<script src="./javascript/jquery.validationEngine-en.js" type="text/javascript"></script>
<script src="./javascript/jquery.validationEngine.js" type="text/javascript"></script>
<script src="./javascript/jquery.fancybox.js?v=2.1.3" type="text/javascript" ></script>




<!--******* Javascript Code for the image shadowbox *******-->
<script type="text/javascript">
$(document).ready(function() {
	/*
	*  Simple image gallery. Uses default settings
	*/
	
	$('.shadowbox').fancybox();
});
</script>

<!--******* Javascript Code for the menu *******-->

<script type="text/javascript">
    $(document).ready(function() {
        $('#menu li').bind('mouseover', openSubMenu);
        $('#menu > li').bind('mouseout', closeSubMenu);

        function openSubMenu() {
            $(this).find('ul').css('visibility', 'visible');
        };

        function closeSubMenu() {
            $(this).find('ul').css('visibility', 'hidden');
        };
    });
</script>

<script type="text/javascript">
    $(function() {
        var pull    = $('#pull');
        menu 		= $('ul#menu');

        $(pull).on('click', function(e) {
            e.preventDefault();
            menu.slideToggle();
        });

        $(window).resize(function(){
            var w = $(window).width();
            if(w > 767 && $('ul#menu').css('visibility', 'hidden')) {
                $('ul#menu').removeAttr('style');
            };
            var menu = $('#menu_wrapper').width();
            $('#pull').width(menu - 20);
        });
    });
</script>

<script type="text/javascript">
    $(function() {
        var menu = $('#menu_wrapper').width();
        $('#pull').width(menu - 20);
    });
</script>
</body>
</html>

