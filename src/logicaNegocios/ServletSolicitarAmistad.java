package logicaNegocios;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletSolicitarAmistad
 */
@WebServlet("/ServletSolicitarAmistad")
public class ServletSolicitarAmistad extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletSolicitarAmistad() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		enviarSolicitud(request,response);
	}

	private void enviarSolicitud(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		if(request.getParameter("idAmigo")!=null&&request.getParameter("idUsuario")!=null){
			try{
				String idamigo=request.getParameter("idAmigo");
				String idusuario=request.getParameter("idUsuario");
				int idAmigo=Integer.valueOf(idamigo);
				int idUsuario=Integer.valueOf(idusuario);
				String mensaje=request.getParameter("text");
				String web= request.getParameter("web");
				String email=request.getParameter("email");
				String asunto=request.getParameter("name");
				data.UtilBasesUsuario.SolicitarAmistad(idamigo,idusuario,mensaje,web,email,asunto);
				response.sendRedirect("ServletPortada?id="+idUsuario);
				
			}catch(Exception e){
				System.out.println("Aqui");
				response.sendRedirect("error.jsp");
			}
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
