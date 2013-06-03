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

/**
 * Servlet implementation class ServletJuego
 */
@WebServlet("/ServletJuego")
public class ServletJuego extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletJuego() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("listarJuegos")!=null){
			String valor=request.getParameter("listarJuegos");
			if(valor.equals("all")){
				System.out.println("Im in to all juegos");
				try {
					UtilBasesJuego.cargarJuegos();
					UtilBasesJuego.ultimos10Juegos();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					response.sendRedirect("error.jsp");
				}
				List<String> lista=ArregloDeDatos.TodosJuegos;
				
				int tama= lista.size();
				int modulo=tama%10;
				tama/=10;
				if(modulo!=0){
					tama++;
				}
				request.getSession().setAttribute("paginadoFinal",tama);
				request.getSession().setAttribute("paginaActual","1");
				response.sendRedirect("juego.jsp");
				
			}
			else{
				response.sendRedirect("error.jsp");
			}
		}
		else if(request.getParameter("id")!=null){
			int id=Integer.valueOf(request.getParameter("id"));
			try {
				System.out.println("Voy a cargar todo juego");
				UtilBasesJuego.cargarJuego(id);
				UtilBasesJuego.ultimos10Juegos(); 
				UtilBasesJuego.cargarIdJuegos(Integer.valueOf(request.getSession().getAttribute("idUsuario").toString()));
				if(UtilBasesJuego.tengojuego(id)){
					request.getSession().setAttribute("tengoJuego","si");
				}
				else{
					request.getSession().setAttribute("tengoJuego","no");
				}
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.sendRedirect("error.jsp");
			}
			response.sendRedirect("portadajuego.jsp");
		}
		else if(request.getParameter("pagina")!=null){
			String valor=request.getParameter("pagina");
			System.out.println("Estoy dentro de juego");
			int val=Integer.valueOf(valor);
			int tama=Integer.valueOf(request.getSession().getAttribute("paginadoFinal").toString());
			if(val<=tama)
			request.getSession().setAttribute("paginaActual",val);
			response.sendRedirect("juego.jsp");
			
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
