package logicaNegocios;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ArregloDeDatos;

import data.UtilBasesClan;
import data.UtilBasesTorneos;
import data.UtilBasesUsuario;

/**
 * Servlet implementation class servletPortada
 */
@WebServlet("/ServletPortada")
public class ServletPortada extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletPortada() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			if(request.getParameter("logout")!=null)
			{
				if(request.getParameter("logout").equals("true"))
				request.getSession().invalidate();
				response.sendRedirect("index.jsp");
			}
			else{
				cargarPortada(request,response);
			}
		
	}

	private void cargarPortada(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		int id=0;
		try{
		id= Integer.valueOf(request.getParameter("id"));
		//tus torneos
		UtilBasesUsuario.cargarTorneos(id);
		UtilBasesUsuario.UltimasPartidas(id);
		//amigos
		UtilBasesUsuario.cargarAmigos(id);
		//juegos
		UtilBasesUsuario.cargarJuegos(id);
		UtilBasesUsuario.cargarIdAmigos(id);
		//clan
		UtilBasesUsuario.cargarClan(id);
		
		
		int idclan=UtilBasesUsuario.obtenerIdClan(id);
		if(idclan!=0)
		UtilBasesClan.usuariosClan(idclan);
		else
		ArregloDeDatos.clan="nada";	
		//ultimos torneos
		UtilBasesTorneos.cargar10Torneos();
		response.sendRedirect("portada.jsp");
		
		}catch(Exception e){
			response.sendRedirect("error.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
;