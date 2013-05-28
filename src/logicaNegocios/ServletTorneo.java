package logicaNegocios;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ArregloDeDatos;

import data.UtilBasesJuego;
import data.UtilBasesTorneos;

/**
 * Servlet implementation class ServletTorneo
 */
@WebServlet("/ServletTorneo")
public class ServletTorneo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletTorneo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if(request.getParameter("listarTorneos")!=null){
			String valor=request.getParameter("listarTorneos");
			if(valor.equals("all")){
				System.out.println("Im in to all torneos");
				try {
					UtilBasesTorneos.cargarTorneos();
					UtilBasesJuego.ultimos10Juegos();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				List<String> lista=ArregloDeDatos.UltimosTorneos;
				
				int tama= lista.size();
				int modulo=tama%10;
				tama/=10;
				if(modulo!=0){
					tama++;
				}
				request.getSession().setAttribute("paginadoFinal",tama);
				request.getSession().setAttribute("paginaActual","1");
				response.sendRedirect("torneo.jsp");
				
			}
			else{
				response.sendRedirect("error.jsp");
			}
		}
		else if(request.getParameter("id")!=null){
			String id = null;
			try {
				id=request.getParameter("id");
				UtilBasesTorneos.cargarTorneo(id);
				UtilBasesJuego.ultimos10Juegos();
				if(UtilBasesTorneos.activo(id)){
					request.getSession().setAttribute("activo","true");
					
					
				}
				else{
					request.getSession().setAttribute("activo","false");
					UtilBasesTorneos.cargarPartidas(id);
					
				}
				response.sendRedirect("torneodetalle.jsp");
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
		}
		else if(request.getParameter("pagina")!=null){
			String valor=request.getParameter("pagina");
			System.out.println("Estoy dentro de pagina");
			int val=Integer.valueOf(valor);
			int tama=Integer.valueOf(request.getSession().getAttribute("paginadoFinal").toString());
			if(val<=tama)
			request.getSession().setAttribute("paginaActual",val);
			response.sendRedirect("torneo.jsp");
			
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
