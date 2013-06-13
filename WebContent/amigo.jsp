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
<link rel="stylesheet" href="stylesheets/main.css" type="text/css" media="screen" title="no title" charset="utf-8"  />
<link rel="stylesheet" href="stylesheets/devices.css" type="text/css" media="screen" title="no title" charset="utf-8"  />
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
    <div id="logo"> <a href="#"><img alt="alt_example" src="./images/logo.png" height="165px" width="315px"  /></a>
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
						<a href="ServletPortada?id=<%out.print(session.getAttribute("idUsuario")); %>"><img src="system/<%out.print(session.getAttribute("avatarUsuario")); %>"  height=100px width=100px style="position:relative;bottom:50%;"></img></a>
						<li ><a href="ServletPerfil?id=<%out.print(session.getAttribute("idUsuario")); %>"><%out.print(session.getAttribute("nombreUsuario")); %></a></li>
						<li><a href="ServletAmigo?listarAmigos=<%out.print(session.getAttribute("idUsuario"));%>">Amigos</a></li>
						<li><a href="ServletClan?listarClanes=all">Clanes</a></li>
						<li><a href="ServletTorneo?listarTorneos=all">Torneos</a></li>
						<li><a href="ServletUsuario?listarUsuarios=all">Usuarios</a></li>
						<li><a href="ServletJuego?listarJuegos=all">Juegos</a></li>
						<li ><a href="ServletPortada?logout=true"><%out.print("Cerrar Sesi&oacute;n"); 
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
            <h2><span>Monster Tournament //</span>Tus Amigos</h2>
            </div>
            <%
            String regex="-.....-";
            List<String> lista= ArregloDeDatos.AmigosUsuario;
            int tama=lista.size();
            int numfinal=Integer.valueOf(session.getAttribute("paginadoFinal").toString());
            int pagina=Integer.valueOf(session.getAttribute("paginaActual").toString());
            int x=0;
            x=pagina-1;
            System.out.println(x);
            int w=x*10+10;
            
            
            if(tama>0)
            {
            	%>
            <ul id="general_news">
            
            <%
            for(x=x*10;x<tama&&x<w;x++){
            	String[] valores=lista.get(x).split(regex);
				String usuario=valores[1];
				String idusuario=valores[0];
				String avatar=valores[2];
				String ganadas=valores[3];
				String perdidas=valores[4];
				String empatadas=valores[5];
				String idclan=valores[6];
				String clan=valores[7];
				
            	%>
            
           
            <li>
             
              <div class="image"><a href="./ServletAmigo?id=<%out.print(idusuario); %>"><img alt="<%out.print(usuario); %>" src="./system/<%out.print(avatar); %>" height="250px" width="250px" /></a></div>
              
            <!--
              <ul class="social_share">
                <li><a href="#"><img alt="alt_example" src="./images/fbk.png" border="0" /></a></li>
                <li><a href="#"><img alt="alt_example" src="./images/twitter.png" border="0" /></a></li>
                <li><a href="#"><img alt="alt_example" src="./images/more.png" border="0" /></a></li>
              </ul> 
            -->
              <div class="info">
                <!--<div class="comments"> 18 </div> -->
                <h2><a href=""><%out.print(usuario); %></a></h2>
                <div class="date_n_author">
                <%
                if(clan.equals("null"))
                {
                	%>
                    <%out.print("Este usuario a&uacute;n no tiene clan"); %></div>
                    <%
                }
                else{
                	%>
                    Clan-<a href="ServletClan?id=<%out.print(idclan); %>">
                    <%out.print(clan); %></a> </div><% 
                }%>
                <p><%out.print(usuario); %><br>
                Partidas Ganadas: <%out.print(ganadas); %><br>
                Partidas Perdidas: <%out.print(perdidas); %><br>
                Partidas Empatadas: <%out.print(empatadas); %><br>
               
                </p>
                <a href="./ServletAmigo?id=<%out.print(idusuario); %>" class="read_more2">&iexcl;Visita su perfil!</a> </div>
                <div class="clear">
                </div>
   
            </li>
            <%} %>
          </ul>
          <ul id="pager">
          	<%for(int y=1;y<=numfinal;y++){ %>
            <!-- <li><a href="#" ><img alt="alt_example" src="./images/left_pager.jpg" border="0"/></a></li> -->
            <% if(pagina==y){%>
            
            <li><a href="ServletAmigo?pagina=<%out.print(y); %>" class="active"><%out.print(y);%></a></li>
            <% }else{%>
            <li><a href="ServletAmigo?pagina=<%out.print(y); %>" ><%out.print(y); %></a></li>
            <!-- <li><a href="#"><img alt="alt_example" src="./images/right_pager.jpg" border="0"/></a></li> -->
            <%}} %>
          </ul>
          <%
          }
            %>
          
          <div class="clear"></div>
          </div>
        <!-- Left wrapper end --> 
        <%
        List<String> imagenes= new ArrayList<String>();
        imagenes=ArregloDeDatos.ImagenesPie;
		
        %>
        <!-- Right wrapper Start -->
        <div  id="right_wrapper">
            
            <div class="review">
            <div class="header"><a href="#">Mejores Juegos</a></div>
            <ul>
            <%
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
                <div class="img"><a href="ServletJuego?id=<%out.print(idjuego);%>"><img alt="alt_example" src="./system/juego/<%out.print(idjuego);%>-2.png" /></a></div>
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
       <p>   <img alt="juego" src="./images/about_img.jpg" align="left" style="margin: 0px 15px 5px 0px; height:120px; width:100%;">Monster Tournament, es un sitio donde podr&aacute;s encontrar a gamers como t&uacute; dispuestos
          a demostrar qui&eacute;n es el mejor en su juego, organiza torneos y guerras de clanes, ademas compite por premios y mucho m&aacute;s.
          Disfruta compitiendo.</p>
          <img alt="juego" src="./images/monster_logo_small.png" style="margin:11px 0px 0px 55px;" height="50px" width="105px"/></div>
      </div>
      <div class="divider_footer"></div>
      <div id="latest_media">
        <div class="header"><a href="#">Mejores Juegos</a></div>
        <div class="body">
        <%
         imagenes= new ArrayList<String>();
        imagenes=ArregloDeDatos.ImagenesPie;
		if(imagenes.size()>0)
		{
        	%>
          <ul id="l_media_list">
          <%
          for(x=0;x<imagenes.size();x++)
          {
         String[] datos= imagenes.get(x).split(regex);
         System.out.println(imagenes.get(x));
         String idjuego=datos[0];
         String nombre= datos[1];
         
          %>
            <li><a class="shadowbox"  rel="gallery" ><img alt="<%out.print(nombre);%>" src="system/juego/<%out.print(idjuego);%>-2.png" height="204px" height="166px" /></a></li>
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
