<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="util.ArregloDeDatos,java.util.ArrayList,java.util.List"

%><html xmlns="http://www.w3.org/1999/xhtml">
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
     <div id="main_news_wrapper">
 
       <div id="row"> 
       <!-- Left wrapper Start -->
        <div id="left_wrapper">
                <div class="header">
                	<h2><span>Torneo //</span> <a>Informaci&oacute;n</a></h2>
                </div>
                 
                <div id="post_wrapper">
                <%
                String regex="-*****-";
                List<String> torneo=ArregloDeDatos.TorneoInfo;
            	List<String> partidas=ArregloDeDatos.PartidasTorneo;
            	String juegoid=torneo.get(0);
            	String juegonombre=torneo.get(1);
            	String torneoid=torneo.get(2);
            	String torneonombre=torneo.get(3);
            	String torneodescripcion=torneo.get(4);
            	String torneoparticipantes=torneo.get(5);
            	String usuarioid=torneo.get(6);
            	String usuario=torneo.get(7);
            	String administradorid=torneo.get(8);
            	String administrador=torneo.get(9);
            	String premioid=torneo.get(10);
            	String premiodescripcion=torneo.get(11);				
        		
            	
                
                %>
                	<!-- Header Start -->
                	<div id="header"> 
                        <div class="info">
                            
                            <h2><%out.print(torneonombre); %></h2>
                            <div class="date_n_author">Creado por <a href="ServletUsuario?id=<%out.print(usuarioid); %>"><%out.print(usuario); %></a></div>
                            
                        </div>
                        
                        <div class="image">
                        	<div class="img_in"><img alt="<%out.print(torneonombre); %>" src="system/juego/<%out.print(juegoid); %>.jpg" /></div>
                        </div>
                        
                    </div>
                    <!-- Header end -->
                    
                    <!-- Body Start -->
                    <div id="body">
                    	
                        <div class="post-review">
                        	<h2><%out.print(torneonombre); %></h2>
							<!-- <div class="overall-score"><img alt="alt_example" src="./images/post/stars/big.png" /></div>
                            <ul>
                                <li>Gameplay <span class="score"><img alt="alt_example" src="./images/post/stars/3.png" /></span></li>
                                <li>Story <span class="score"><img alt="alt_example" src="./images/post/stars/2.png" /></span></li>
                                <li>Graphics <span class="score"><img alt="alt_example" src="./images/post/stars/4.png" /></span></li>
                            </ul>-->
						</div>
                        
                    	<p><h2>Numero de participantes:<%out.print(torneoparticipantes); %></h2><br></p>
                    	
                    	<p><h3>Juego:<a href="ServletJuego?id=<%out.print(juegoid);%>"> <%out.print(juegonombre); %></a></h3><br></p>
                    	
                    	<p>
                    	<h6><%out.print(torneodescripcion); %></h6>
                    	<%
                    	for(int x=0;x<partidas.size();x++)
                    	{
                    	String dato=partidas.get(x);
                    	String[] valores= dato.split(regex);
                    	
                    	String nombretipo=valores[0];
                    	String idpartidas=valores[1];
                    	String idusuarioganador=valores[2];
                    	String usuarioganador=valores[3];
                    	String fecha=valores[4];
                    	String participantes=valores[5];
                    	String ronda=valores[6];
                    	%>
                    	<ul>
                    	<li>Tipo de partida:<%out.print(nombretipo); %> </li>
                    	<li>Fecha de la partida:<%out.print(fecha); %></li>
                    	<li>Numero de Participantes:<%out.print(participantes); %></li>
                    	<li>Ronda:<%out.print(ronda); %></li>
                    	</ul>
                    	<%
                    	
                    	}                    	
                    	
                    	if(!session.getAttribute("activo").equals("true"))
                        {
                        %>
                    	
                    	<%out.print("<h4>Este torneo ya termino.</h4>"); }
                    	else{
                    		out.print("<h4>Si deseas participar en este torneo, solamente envianos un mensaje</h4>");
                    	}
                    	%>
                    	</p>
                    </div>
                    <!-- Body end -->
                    
                    <!-- Comments Start 
                    <div id="comments">
                    	<div class="header">5 COMMENTS <span>ON "<span class="cyan">INTERDUM ULTRICES AUGUE</span>"</span></div>
                        
                        <ul>
                        	<li>
                            	<img alt="alt_example" class="indent" src="./images/post/indent.jpg" />
                            	<div class="avatar"><img alt="alt_example" src="./images/post/avatar.png" /></div>
                                <div class="comment"><p><strong>Bob</strong> <small>April 12, 2011 at 12:01 am - <a href="#">Reply</a></small></p>
                                Duis nunc lectus, lobortis quis sollicitudin vel, hendrerit et augue. Curabitur porta auctor augue. Cras dignissim imperdiet sem at sollicitudin.</div>
                                <div class="clear"></div>
                            </li>
                            
                            <li>
                            	<ul>
                                	<li>
                                    <img alt="alt_example" class="indent" src="./images/post/indent.jpg" />
                                    <div class="avatar"><img alt="alt_example" src="./images/post/avatar.png" /></div>
                                    <div class="comment"><p><strong>Bob</strong> <small>April 12, 2011 at 12:01 am - <a href="#">Reply</a></small></p>
                                    Morbi lobortis nisi eget ligula varius at bibendum tortor condimentum.</div>
                                    <div class="clear"></div>
                                    </li>
                                </ul>
                            </li>
                            <li>
                            	<ul>
                                	<li>
                                    <img alt="alt_example" class="indent" src="./images/post/indent.jpg" />
                                    <div class="avatar"><img alt="alt_example" src="./images/post/avatar.png" /></div>
                                    <div class="comment"><p><strong>Bob</strong> <small>April 12, 2011 at 12:01 am - <a href="#">Reply</a></small></p>
                                   Aliquam auctor consequat ligula vitae feugiat. Morbi lobortis nisi eget ligula varius at bibendum tortor condimentum. Duis nunc lectus.
                                   </div>
                                    <div class="clear"></div>
                                    </li>
                                </ul>
                            </li>
                            
                            <li>
                            	<img alt="alt_example" class="indent" src="./images/post/indent.jpg" />
                            	<div class="avatar"><img alt="alt_example" src="./images/post/avatar.png" /></div>
                                <div class="comment"><p><strong>Bob</strong> <small>April 12, 2011 at 12:01 am - <a href="#">Reply</a></small></p>
                                Morbi lobortis nisi eget ligula varius at bibendum tortor condimentum hendrerit et augue. Curabitur porta auctor augue. Cras dignissim imperdiet sem at sollicitudin. </div>
                                <div class="clear"></div>
                            </li>
                        </ul>
                    
                    </div>
                     Comments end -->
                    
                    <!-- Leave a response Start -->
                    <%
                    if(session.getAttribute("activo").equals("true"))
                    {
                    	%>
                    <div id="response">
                    	<div class="header">Pide Jugar en este torneo</div>

                        <form id="form" action="ServletSolicitarTorneo">
                        	<div class="form_left">
                           
                                <label>Nombre <small><em>(requerido)</em></small></label>
                                <input name="name" type="text" class="validate[required,custom[onlyLetter],length[0,100]] text-input" id="name" value="<%out.print(session.getAttribute("nombreUsuario"));%>"/>
                             	<input type="hidden" name="idUsuario" value="<%out.print(session.getAttribute("idUsuario"));%>"/>
                             	
                                <label>Email <small><em>(requerido para que te contacte)</em></small></label>
                                <input name="email" type="text" class="validate[required,custom[email]] text-input" id="email" />
                              
                                <label>Sitio Web(facebook/twitter)</label>
                                <input type="text" name="web" id="web" />
                          
                            </div>
                            <div class="form_right">
                            <p class="text">
                            <label>Mensaje <small><em>(obligatorio)</em></small></label>
                            <textarea name="text" class="validate[required,length[6,300]] text-input" id="comment" cols="10" rows="10">
                            Hola soy <%out.print(session.getAttribute("nombreUsuario"));%> y me gustaria participar en este torneo :)
                            </textarea>
                            </p>
    						</div>
                            
                            <div class="form_submit"><input type="submit" value="Enviar" class="read_more2" />
                            </div>
                        </form>

                    </div>
                    <%} %>
                    <!-- Leave a response end -->  
                    
                    
                    <div class="clear"></div>
               </div>
                            
            </div>
            <!-- Left wrapper end -->
            
            <!-- Right wrapper Start -->
            <div id="right_wrapper">
        	
            	
                
                <div class="review">
                  <div class="header"><a href="#">Mejores Juegos</a></div>
            <ul>
            <%
            List<String> imagenes=ArregloDeDatos.ImagenesPie;
            List<String> miembros=ArregloDeDatos.UsuariosClan;
            if(imagenes.size()>0)
			{
            	for(int contador=0;contador<imagenes.size();contador++)
            	{
            		String[] datos= imagenes.get(contador).split(regex);
                    System.out.println(imagenes.get(contador));
                    String idjuego=datos[0];
                    String nombre= datos[1]; 
			%>
              <li>
                <div class="img"><a href="ServletJuego?id=<%out.print(idjuego);%>"><img alt="alt_example" src="./system/juego/<%out.print(idjuego);%>-2.jpg" /></a></div>
                <div class="info"> <a href="./post_game.html"><%out.print(nombre);%></a><br/>
                  <small>&iexcl;Revisalo!</small><br/>
                  <img alt="alt_example" src="./images/stars.png" /> </div>
              </li>
             <%
            	}
			}
             %>
            </ul>
              </div>
              
              <div class="advert">
                <a href="http://themeforest.net/user/Skywarrior" target="_blank"><img alt="alt_example" src="./images/advert_r.jpg" border="0" /></a>
              </div>
                
               
                
                 
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
<script src="./javascript/jquery.validationEngine-en.js" type="text/javascript"></script>
<script src="./javascript/jquery.validationEngine.js" type="text/javascript"></script>
<script src="./javascript/jquery.fancybox.js?v=2.1.3" type="text/javascript" ></script>

<!--******* Javascript Code for the comment form *******-->
<script type="text/javascript">
$(document).ready(function() {

	// SUCCESS AJAX CALL, replace "success: false," by:     success : function() { callSuccessFunction() }, 
	$("#form").validationEngine({
		ajaxSubmit: true,
			ajaxSubmitFile: "ajaxSubmit.php",
			ajaxSubmitMessage: "Thank you, your post has been submitted!",
		success :  false, ajaxSubmitMessage: "Thank you, your post has been submitted!",
		failure : function() {}
	})


});
</script>


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
