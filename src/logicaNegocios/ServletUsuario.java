package logicaNegocios;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ArregloDeDatos;
import data.UtilBasesClan;
import data.UtilBasesJuego;
import data.UtilBasesTorneos;
import data.UtilBasesUsuario;

/**
 * Servlet implementation class ServletUsuario
 */
@WebServlet("/ServletUsuario")
public class ServletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getParameter("listarUsuarios")!=null){
			String valor=request.getParameter("listarUsuarios");
			if(valor.equals("all")){ 
				System.out.println("Im in to all usuarios");
				try {
					String id=request.getSession().getAttribute("idUsuario").toString();
					UtilBasesUsuario.cargarIdAmigos(id);
					UtilBasesUsuario.allUsuarios();
					UtilBasesJuego.ultimos10Juegos();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				List<String> lista=ArregloDeDatos.TodosUsuarios;
				
				int tama= lista.size();
				int modulo=tama%10;
				tama/=10;
				if(modulo!=0){
					tama++;
				}
				request.getSession().setAttribute("paginadoFinal",tama);
				request.getSession().setAttribute("paginaActual","1");
				response.sendRedirect("usuario.jsp");
				
			}
			else{
				response.sendRedirect("error.jsp");
			}
		}
		else if(request.getParameter("id")!=null){
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
			//clan
			UtilBasesUsuario.cargarClan(id);
			
			int idclan=UtilBasesUsuario.obtenerIdClan(id);
			if(idclan!=0)
			UtilBasesClan.usuariosClan(idclan);
			else
			ArregloDeDatos.clan="nada";	
			//ultimos torneos
			UtilBasesTorneos.cargar10Torneos();
			String nombre=UtilBasesUsuario.cargarNombre(id);
			request.getSession().setAttribute("nombreAmigo",nombre);
			request.getSession().setAttribute("idAmigo",id);
			
			response.sendRedirect("portadausuario.jsp");
			
			
			
			}catch(Exception e){
				response.sendRedirect("error.jsp");
			}
		}
		else if(request.getParameter("pagina")!=null){
			String valor=request.getParameter("pagina");
			System.out.println("Estoy dentro de pagina");
			int val=Integer.valueOf(valor);
			int tama=Integer.valueOf(request.getSession().getAttribute("paginadoFinal").toString());
			if(val<=tama)
			request.getSession().setAttribute("paginaActual",val);
			response.sendRedirect("usuario.jsp");
			
		}
		else{
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
