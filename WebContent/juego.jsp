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
                	<h2><span>Monster Tournament //</span> Juegos de la comunidad</h2>
                </div>
                 <%
                 String regex="-*$#*-";
	            List<String> lista= ArregloDeDatos.TodosJuegos;
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
                <!-- Gallery wrapper Start --> 
                <ul id="gallery_wrapper">
                <% 
	                if(pagina==1){
	                %>
	                <li><a href="ServletRegistrarJuego?idUsuario=<%out.print(session.getAttribute("idUsuario")); %>" rel="gallery" ><img alt="a�adir Juego" src="system/juego/new.png" height="200px" width="200px" /></a></li>
                    
                	<%
                	}

                for(x=x*10;x<tama&&x<w;x++){ 
                	String[] valores=lista.get(x).split(regex);
    				String idjuego=valores[0];
    				String juego=valores[1];
    				String video=valores[2];
    				
		    				%>
		    				<li><a class="shadowbox" href="ServletJuego?id=<% out.print(idjuego);  %>"  rel="main_gallery" ><img alt="<%out.print(juego); %>" src="system/juego/<%out.print(idjuego); %>-2.jpg" height="250px" width="250px"/></a></li>
		                	<%
                    } %>
               </ul>
               <%} %>
               <!-- Gallery wrapper end --> 
               <div> 
               <ul id="pager">
          	<%for(int y=1;y<=numfinal;y++){ %>
            <!-- <li><a href="#" ><img alt="alt_example" src="./images/left_pager.jpg" border="0"/></a></li> -->
            <% if(pagina==y){%>
            
            <li><a href="ServletJuego?pagina=<%out.print(y); %>" class="active"><%out.print(y);%></a></li>
            	<%if(y%15==0){ %>
            	<br>
            <% }}else{%>
            <li><a href="ServletJuego?pagina=<%out.print(y); %>" ><%out.print(y); %></a></li>
            <!-- <li><a href="#"><img alt="alt_example" src="./images/right_pager.jpg" border="0"/></a></li> -->
            <%if(y%15==0){ %>
            	<br>
            <% }}} %>
          </ul>
            </div>
            <div class="clear"></div>              
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
        <div class="header"><a href="#">About ORIZON</a></div>
        <div class="body">
          <p><img alt="alt_example" src="./images/about_img.png" align="left" style="margin:0px 15px 5px 0px;"  />Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
          <p>Praesent aliquet justo quis lacus mollis molestie pellentesque habitant morbi tristique senectus et e. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Quisque pulvinar urna eget ante pharetra vitae fermentum dui sagittis. Vivamus non ipsum elit, et tincidunt quam.</p>
          <img alt="alt_example" src="./images/orizon_about.png" style="margin:11px 0px 0px 55px;"/></div>
      </div>
      <div class="divider_footer"></div>
      <div id="latest_media">
        <div class="header"><a href="#">latest media</a></div>
        <div class="body">
          <ul id="l_media_list">
            <li><a class="shadowbox" href="./images/media/full/1.jpg" rel="gallery" ><img alt="alt_example" src="./images/media/thumb/1.jpg" /></a></li>
            <li><a class="shadowbox" href="./images/media/full/1.jpg" rel="gallery" ><img alt="alt_example" src="./images/media/thumb/1.jpg" /></a></li>
            <li><a class="shadowbox" href="./images/media/full/1.jpg" rel="gallery" ><img alt="alt_example" src="./images/media/thumb/1.jpg" /></a></li>
            <li><a class="shadowbox" href="./images/media/full/1.jpg" rel="gallery" ><img alt="alt_example" src="./images/media/thumb/1.jpg" /></a></li>
            <li><a class="shadowbox" href="./images/media/full/1.jpg" rel="gallery" ><img alt="alt_example" src="./images/media/thumb/1.jpg" /></a></li>
            <li><a class="shadowbox" href="./images/media/full/1.jpg" rel="gallery" ><img alt="alt_example" src="./images/media/thumb/1.jpg" /></a></li>
            <li><a class="shadowbox" href="./images/media/full/1.jpg" rel="gallery" ><img alt="alt_example" src="./images/media/thumb/1.jpg" /></a></li>
            <li><a class="shadowbox" href="./images/media/full/1.jpg" rel="gallery" ><img alt="alt_example" src="./images/media/thumb/1.jpg" /></a></li>
            <li><a class="shadowbox" href="./images/media/full/1.jpg" rel="gallery" ><img alt="alt_example" src="./images/media/thumb/1.jpg" /></a></li>
            <li><a class="shadowbox" href="./images/media/full/1.jpg" rel="gallery" ><img alt="alt_example" src="./images/media/thumb/1.jpg" /></a></li>
          </ul>
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
