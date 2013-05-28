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
<link rel="stylesheet" href="stylesheets/main.css" />
<link rel="stylesheet" href="stylesheets/devices.css" />
<link rel="stylesheet" href="stylesheets/paralax_slider.css" />
<link rel="stylesheet" href="stylesheets/jquery.fancybox.css?v=2.1.2" type="text/css"  media="screen" />
<!--[if IE]>
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
    
    <!--********************************************* Banner start *********************************************-->
    
    <% 
    //cargamos los datos de las clases estaticas;
    String regex="-*$#*-"; 
    List<String>   UltimosTorneos = new ArrayList<String>();
    List<String>   JuegosUsuario = new ArrayList<String>();
    List<String>   PartidasUsuario = new ArrayList<String>();
    List<String>   AmigosUsuario = new ArrayList<String>();
    JuegosUsuario= ArregloDeDatos.JuegosUsuario;
    String idAmigo= session.getAttribute("idAmigo").toString(); 
    UltimosTorneos=ArregloDeDatos.TorneosUsuario;
    PartidasUsuario= ArregloDeDatos.PartidasUsuario;
    AmigosUsuario=ArregloDeDatos.AmigosUsuario;
    
    	
    
    System.out.println(UltimosTorneos.size());
    if(UltimosTorneos.size()>0){
    	 
    %>
    <div id="da-slider" class="da-slider">
    <%
			    for(int x=0;x<UltimosTorneos.size();x++)
			    {
			    	System.out.println(UltimosTorneos.get(0));
			    	String valor=UltimosTorneos.get(x);
			    	String[] valores=valor.split(regex);
			    	//id torneo, nombre torneo, descripcion, juego id;
			    %>
			    <div class="da-slide">
			        <h2><a href="ServletTorneo?id=<%out.print(valores[0]); %>" class="da-link"><%out.print(valores[1]); %></a></h2>
			        <p>
			        <%out.print(valores[2]); %>
			        </p>
			        <div class="da-img"><img alt="juegoCaratula" src="system/juego/<%out.print(valores[3]); %>.jpg" width="610px" height="290px" /></div>
			      </div>
			    <%	
			    }
    %>
    </div><% 
			    
    }
    
    %>
      
      
    
    <!--********************************************* Banner end *********************************************-->
    
    <div class="top_shadow"></div>
    
    <!--********************************************* Hot news start *********************************************-->
     <%
      		if(PartidasUsuario.size()>0){
		    	  	
	%>
    <div id="hot_news">
      <div class="header">
        <h1><span> Partidas de <%out.print(session.getAttribute("nombreAmigo")); %>//</span>Revisa la informacion de la Partida</h1>
      </div>
      
      <!-- Previous and next selector --> 
      <a id="prev" class="prev" href="#"><img alt="alt_example" src="./images/blank.gif" width="21" height="33" border="0" /></a> <a id="next" class="next" href="#"><img alt="alt_example" src="./images/blank.gif" width="21" height="33" border="0" /></a>
      <ul id="hot_news_box">
      <%
      for(int x=0;x<PartidasUsuario.size();x++)
	  	{
		    	  	//select torneo.id, torneo.nombre, partida.id, partida.ronda, usuario_has_partida.posicion 	
		    	  	
		    	  	String valor= PartidasUsuario.get(x);
		    	  	System.out.println(valor);
		    	  	String[] partidaUsuario= valor.split(regex);
		    	  	String idTorneo=partidaUsuario[0];
		    	  	String nombre= partidaUsuario[1];
		    	  	String partidaid=partidaUsuario[2];
		    	  	String ronda= partidaUsuario[3];
		    	  	String posicion= partidaUsuario[4];
		    	  	String descripcion= partidaUsuario[5];
		      %>
        <li>
          <h2><a href="ServletTorneo?id=<%out.print(idTorneo);  %>"><% out.print(nombre); %></a></h2>
          <div class="image"><a href="#"><img alt="juego" src="system/images/<%out.print(posicion); %>lugar.png" height=81px width=100px/></a></div>
          <div class="content">
            <p><%out.print(descripcion); %></p>
            <div class="info"> <a href="ServletPartida?id=<%out.print(partidaid);  %>" class="read_more">Ver Partida</a> </div>
          </div>
        </li>
        
       <%
		    	  }%>
      </ul>
    </div>
    <% 
		 }
       %>

      
     
    <!--********************************************* Hot news end *********************************************--> 
    
    <!--********************************************* Main start *********************************************-->
    <%
      		if(JuegosUsuario.size()>0){
		    	  	%>
    <div id="main_news_wrapper">
 
       <div id="row"> 
        <!-- Left wrapper Start -->
        
        <div id="left_wrapper">
        <div class="header">
            <h2><span>Juegos de <%out.print(session.getAttribute("nombreAmigo")); %>//</span> Mas info.</h2>
          </div>
          <ul id="general_news">
           <%
           for(int x=0;x<JuegosUsuario.size();x++)
           {
		    	  	String valor= JuegosUsuario.get(x);
		    	  	String[] juegoInfo= valor.split(regex);
		    	  	String idjuego=juegoInfo[0];
		    	  	String nombre= juegoInfo[1];
		    	  	String descripcion= juegoInfo[2];
		      %>
            <li>
              <div class="image"><a href="ServletJuego?id=<%out.print(idjuego); %>" ><img alt="alt_example" src="system/juego/<%out.print(idjuego); %>-1.jpg" /></a></div>
              <!--<ul class="social_share">
                <li><a href="#"><img alt="alt_example" src="./images/fbk.png" border="0" /></a></li>
                <li><a href="#"><img alt="alt_example" src="./images/twitter.png" border="0" /></a></li>
                <li><a href="#"><img alt="alt_example" src="./images/more.png" border="0" /></a></li>
              </ul>-->
              <div class="info">
                <h2><a href="ServletJuego?id=<%out.print(idjuego); %>" ><%out.print(nombre); %></a></h2>
                <p><%out.print(descripcion); %>...</p>
                <a href="ServletJuego?id=<%out.print(idjuego); %>" class="read_more2">M&aacute;s sobre el juego</a> </div>
                <div class="clear">
              </div>
            </li>
		  
          <%
		    	  	}
           %>         
		  </ul>
		  <!---
          <ul id="pager">
            <li><a href="#" ><img alt="alt_example" src="./images/left_pager.jpg" border="0"/></a></li>
            <li><a href="#" >1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#" class="active">3</a></li>
            <li><a href="#"><img alt="alt_example" src="./images/right_pager.jpg" border="0"/></a></li>
          </ul>
          -->
          
          <div class="clear"></div>
          
           </div>
           <% 
			      }
		    	   %>
        <!-- Left wrapper end --> 
        
        <!-- Right wrapper Start -->
        <div id="right_wrapper">
         <!--  <div id="search">
            <input type="text" onblur="if(this.value =='') this.value='search'" onfocus="if (this.value == 'search') this.value=''" value="search" name="s" class="required" id="s" />
            <input type="button" />
          </div> -->
           <%
            if(AmigosUsuario.size()>0){
            	%>
          		<div class="review">
          
		            <div class="header"><a href="#">Amigos de <%out.print(session.getAttribute("nombreAmigo")); %></a></div>
		            <ul>
		           <% 
	    	  	for(int x=0;x<AmigosUsuario.size();x++)
	    	  	{
	    	  		String amigo=AmigosUsuario.get(x);
	    	  		//select usuario.id, usuario.usuario, usuario.avatar,usuario.ganadas
	    	  		String[] valores= amigo.split(regex);
	    	  		String idamigo=valores[0];
	    	  		String usuario=valores[1];
	    	  		String avatar=valores[2];
	    	  		String ganadas=valores[3];
	    	  		if(idamigo.equals(session.getAttribute("idUsuario"))){
	    	  			%>
	    	              <li>
	    	                <div class="img"><a href="ServletPortada?id=<%out.print(idamigo); %>"><img alt="fotoamigo" src="system/<%out.print(avatar); %>" /></a></div>
	    	                <div class="info"> <a href="ServletPortada?id=<%out.print(idamigo); %>"><%out.print(usuario); %></a><br/>
	    	                  <small>Victorias: <%out.print(ganadas); %></small><br/>
	    	                  <img alt="alt_example" src="./images/stars.png" /> </div>
	    	              </li>
	    	            <%	
	    	  		}
	    	  		else{
			            %>
			              <li>
			                <div class="img"><a href="ServletUsuario?id=<%out.print(idamigo); %>"><img alt="fotoamigo" src="system/<%out.print(avatar); %>" /></a></div>
			                <div class="info"> <a href="ServletUsuario?id=<%out.print(idamigo); %>"><%out.print(usuario); %></a><br/>
			                  <small>Victorias: <%out.print(ganadas); %></small><br/>
			                  <img alt="alt_example" src="./images/stars.png" /> </div>
			              </li>
			            <%
	    	  	}}%>
            </ul>
          </div>
          <% 
	    	  }
            %>  
          
          <div class="advert">
            <a href="http://themeforest.net/user/Skywarrior" target="_blank"><img alt="alt_example" src="./images/advert_r.jpg" border="0" /></a>
          </div>
          <%
          String NombreClan= ArregloDeDatos.clan;
          if(NombreClan.equals("nada"))
          {
        	  NombreClan="Este usuario aun no tiene un  Clan";
			%>
             
              <%
              
          }
          else{
        	  List<String>   MiembrosClan = new ArrayList<String>();
        	  MiembrosClan= ArregloDeDatos.UsuariosClan;
        	   String[] Nombre=NombreClan.split(regex);
        	   
        	  %>
        	   <div class="categories">
                <div class="header"><a href="ServletClan?id=<%out.print(Nombre[0]);%>"> <%out.print(Nombre[1]); %>  </a></div>
                <ul>
                <%
                for(int x=0;x<MiembrosClan.size();x++)
	    	  	{
                String Miembro= MiembrosClan.get(x);
                String[] datos=Miembro.split(regex);
                %>
                  <li> <a href="ServletUsuario?id=<%out.print(datos[0]);%>" > <% out.print(datos[1]); %></a> </li>
              <%
	    	  	}
              %>
              </ul>
              </div>
              <% 
                
          }
        	  
          %>
          
                 
      
      <!-- Right wrapper end -->
      
        </div>
      	<div class="clear"></div>
        
        </div>
      </div>
    <!-- Leave a response Start -->
    <div style="margin-left:50px;padding-left: 50px;padding-top: 20px;padding-bottom: 20px;  margin-top:50px; margin-bottom:50px;
    background:white; width:50%;">
                    <div id="response">
                    	<h1>Envia un Mensaje</h1>

                        <form id="form" action="ServletEnviarMensaje">
                        	<div class="form_left">
                           
                                <label>Asunto <small><em>(requerido)</em></small></label>
                                <input name="asunto" type="text" class="validate[required,custom[onlyLetter],length[0,100]] text-input" id="name" />
                             	<input type="hidden" name="idUsuario" value="<%out.print(session.getAttribute("idUsuario"));%>"/>
	                            <input type="hidden" name="idAmigo" value="<%out.print(idAmigo);%>"/>
                             	<label>Email <small><em>(requerido para que te contacte)</em></small></label>
                                <input name="email" type="text" class="validate[required,custom[email]] text-input" id="email" />
                              
                                <label>Sitio Web<small>(facebook/twitter)</small></label>
                                <input type="text" name="web" id="web" />
                          
                            </div>
                            <div class="form_right">
                            <p class="text">
                            <label>Mensaje <small><em>(obligatorio)</em></small></label>
                            <textarea name="text" class="validate[required,length[6,300]] text-input" id="comment" cols="10" rows="10"></textarea>
                            </p>
    						</div>
                            
                            <div class="form_submit"><input type="submit" value="Enviar" class="read_more2" />
                            </div>
                        </form>

                    </div>
         </div> 
                    <!-- Leave a response end -->
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
  <!--********************************************* Main_in end *********************************************--> 
  
  <a id="cop_text" href="http://themeforest.net/user/Skywarrior"> Made by Skywarrior Themes</a> 
  </div>
</div>
<!--********************************************* Main wrapper end *********************************************--> 

<script src="http://code.jquery.com/jquery-1.8.3.min.js" type="text/javascript"></script> 
<script src="./javascript/jquery.carouFredSel-6.1.0.js" type="text/javascript"></script> 
<script src="./javascript/jquery.cslider.js" type="text/javascript" ></script> 
<script src="./javascript/modernizr.custom.28468.js" type="text/javascript"></script> 
<script src="./javascript/getTweet.js" type="text/javascript" ></script> 
<script src="./javascript/jquery.fancybox.js?v=2.1.3" type="text/javascript" ></script> 

<!--******* Javascript Code for the Hot news carousel *******--> 
<script type="text/javascript">
	$(document).ready(function() {
	
		// Using default configuration
		$("#sd").carouFredSel();
		
		// Using custom configuration
		$("#hot_news_box").carouFredSel({
			items				: 3,
			direction			: "right",
			prev: '#prev',
			next: '#next',
			scroll : {
				items			: 1,
				height			: 250,
				easing			: "quadratic",
				duration		: 2000,							
				pauseOnHover	: true
			}	
		});	
	})
</script> 


<!--******* Javascript Code for the Main banner *******--> 
<script type="text/javascript">
	$(function() {
	
		$('#da-slider').cslider({
			autoplay	: true,
			bgincrement	: 450
		});
	
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
