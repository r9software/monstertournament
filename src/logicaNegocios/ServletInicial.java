package logicaNegocios;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.UtilBasesJuego;

/**
 * Servlet implementation class ServletInicial
 */
@WebServlet("/ServletInicial")
public class ServletInicial extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletInicial() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("cargar")!=null)
		{
			if(request.getParameter("cargar").equals("all"))
				try {
					cargarPortada(request,response);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					response.sendRedirect("error.jsp");
				}
			response.sendRedirect("index.jsp");
		}
		
	}

	private void cargarPortada(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException {
		// TODO Auto-generated method stub
		UtilBasesJuego.ultimos10Juegos();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
