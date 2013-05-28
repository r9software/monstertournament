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

/**
 * Servlet implementation class SevletClan
 */
@WebServlet("/ServletClan")
public class ServletClan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletClan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("listarClanes")!=null){
			String valor=request.getParameter("listarClanes");
			if(valor.equals("all")){
				System.out.println("Im in to all clanes");
				try {
					UtilBasesClan.cargarClanes();
					UtilBasesJuego.ultimos10Juegos();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				List<String> lista=ArregloDeDatos.TodosClanes;
				
				int tama= lista.size();
				int modulo=tama%10;
				tama/=10;
				if(modulo!=0){
					tama++;
				}
				request.getSession().setAttribute("paginadoFinal",tama);
				request.getSession().setAttribute("paginaActual","1");
				response.sendRedirect("clan.jsp");
				
			}
			else{
				response.sendRedirect("error.jsp");
			}
		}
		else if(request.getParameter("id")!=null){
			try{
				int id=Integer.valueOf(request.getParameter("id"));
				String idowner=UtilBasesClan.cargarCreadorClan(""+id);
					if(!request.getSession().getAttribute("idUsuario").toString().equals(idowner))
					{
					UtilBasesJuego.ultimos10Juegos();
					UtilBasesClan.usuariosClan(id);
					UtilBasesClan.cargarInformacionClan(id);
					response.sendRedirect("clandetalle.jsp");
					}
					else{
						response.sendRedirect("perfilclan.jsp");
					}
			}
			catch(Exception e){
				response.sendRedirect("error.jsp");
			}
		}
		else if(request.getParameter("pagina")!=null){
			String valor=request.getParameter("pagina");
			System.out.println("Estoy dentro de clan");
			int val=Integer.valueOf(valor);
			int tama=Integer.valueOf(request.getSession().getAttribute("paginadoFinal").toString());
			if(val<=tama)
			request.getSession().setAttribute("paginaActual",val);
			response.sendRedirect("clan.jsp");
			
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
