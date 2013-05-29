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
					<%
					response.sendRedirect("index.jsp");
					}
					else{ %>
						<li><a href="ServletPortada?id=<%out.print(session.getAttribute("idUsuario")); %>"><img src="system/<%out.print(session.getAttribute("avatarUsuario")); %>" height=100px width=100px></img></a></li>
						<li ><a href="ServletPerfil?id=<%out.print(session.getAttribute("idUsuario")); %>"><%out.print(session.getAttribute("nombreUsuario")); %></a></li>
						<li><a href="ServletAmigo?listarAmigos=<%out.print(session.getAttribute("idUsuario"));%>">Amigos</a></li>
						<li><a href="ServletClan?listarClanes=all">Clanes</a></li>
						<li><a href="ServletTorneo?listarTorneos=all">Torneos</a></li>
						<li><a href="ServletUsuario?listarUsuarios=all">Usuarios</a></li>
						<li><a href="ServletJuego?listarJuegos=all">Juegos</a></li>
						<li ><a href="ServletPortada?logout=true"><%out.print("Cerrar Sesion"); 
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

            <!-- Full page wrapper Start -->
            <div id="full_page_wrapper">
                    	
                <div class="header">
                	<h2><span>PERFIL //</span><%out.print(session.getAttribute("nombreUsuario")); %></h2>
                </div>
                 
                <div id="post_wrapper">
                
                    
                    <!-- Body Start -->
                    <div id="body">
                    	<h1>Cambiar imagen</h1>
                    	<span><small>La imagen debe de ser png </small></span>
 						<form method="post" enctype='multipart/form-data' action="ServletSubirImagen">
 						Por favor, seleccione fichero a subir<br/>
 						<input type="file" name="fichero" /> 
 						<input type="submit" />
 						</form>
                        <% 
                        String regex="-*****-";
                        if(request.getAttribute("subido")!=null){
 							if(request.getAttribute("subido").toString().equals("true")){
 						%>
 						<p style="color: green">Fichero subido correctamente.</p>
 						<%}
 							else{
 							%>
 							<p style="color: green">Fichero Incorrecto, demasiado grande para ser subido</p>
 							<% 	
 							}	
                        }%>
 					<h4>Datos de partidas:</h4>
 					<%
 					 List<String> DatosUsuario = new ArrayList<String>();
 					 DatosUsuario=ArregloDeDatos.DatosUsuario;
 					 
 					%>
 					<p>
 					<h6>Torneos Ganados: <%out.print(DatosUsuario.get(11)); %></h6>
 					<h6>Partidas ganadas: <%out.print(DatosUsuario.get(7)); %></h6>
					<h6>Partidas perdidas: <%out.print(DatosUsuario.get(8)); %></h6>
					<h6>Partidas empatadas: <%out.print(DatosUsuario.get(9)); %></h6>
 					</p>	
 					
 					<h1 class="title">Modifica tus datos de acceso</h1>
                            <form id="form" action="ServletPerfil" method= "get" autocomplete="on" name="f1"> 
                                <div class="info-box"> 
                                <h5> 
                                    <label for="usernamesignup" class="uname" data-icon="u">Nombre de usuario</label></h5>
                                    <input id="usernamesignup" name="usuario" required="required" type="text" placeholder="mysuperusername690" value="<%out.print(DatosUsuario.get(1)); %>"/>
                                </div>
                                <div class="info-box"> 
                                <h5>
                                    <label for="emailsignup" class="youmail" data-icon="e" >Email</label></h5>
                                    <input id="emailsignup" disabled="disabled" name="email" required="required" type="email" placeholder="mysupermail@mail.com" value="<%   out.print(DatosUsuario.get(2));%> "/>
                                    <small>El correo no se puede modificar por motivos de seguridad</small> 
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
                                    <input id="usernamesignup" name="nombre" required="required" type="text" placeholder="Tu gran nombre" value="<%out.print(DatosUsuario.get(4)); %>"/>
                                </div>
                                <div class="info-box"> 
                                <h5> 
                                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="u">Apellidos </label></h5>
                                    <input id="usernamesignup" name="apellidos" required="required" type="text" placeholder="Tu Apellido" value="<%out.print(DatosUsuario.get(5)); %>"/>
                                </div>
                               <!-- 
                                <div class="info-box"> 
                                <h5> 
                                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="u">Imagen de Perfil</label></h5>
                                  </div>
                                   -->
                                <div class="info-box"> 
                                </div>
                                <a class="button purple" style="opacity: 1; " > 
                                <input type="submit" value="Enviar"> 
                                </a>
                                
                            </form>
                    </div>
                    <!-- Body end -->
                    
                    <div class="clear"></div>
               </div>
                            
            </div>
            <!-- Full page wrapper end -->

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
     
     <a id="cop_text" href="http://themeforest.net/user/Skywarrior"> Made by Skywarrior Themes</a>
     
	</div>
</div>
<!--********************************************* Main wrapper end *********************************************--> 

<script src="http://code.jquery.com/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="./javascript/getTweet.js" type="text/javascript" ></script>
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

