package logicaNegocios;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Mail;
import bean.UsuarioBean;

import data.UtilBasesJuego;
import data.UtilBasesUsuario;

/**
 * Servlet implementation class ServletPerfil
 */
@WebServlet("/ServletPerfil")
public class ServletPerfil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletPerfil() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("id")!=null){
			String id=request.getSession().getAttribute("idUsuario").toString();
			try {
				UtilBasesUsuario.CargarDatosUsuario(id);
				UtilBasesJuego.ultimos10Juegos();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect("perfil.jsp");
			
		}
		else{
			System.out.println("Entre");
			String id=request.getSession().getAttribute("idUsuario").toString();
			String usuario;
			String email;
			String nombre;
			String apellido;
			String password;
			
			usuario=request.getParameter("usuario");
			email=request.getParameter("email");
			nombre=request.getParameter("nombre");
			apellido=request.getParameter("apellidos");
			password=request.getParameter("pas");
			UsuarioBean Datos= new UsuarioBean();
			Datos.setId(Integer.valueOf(id));
			Datos.setUsuario(usuario);
					Datos.setPassword(password);
							Datos.setEmail(email);
									Datos.setNombre(nombre);
											Datos.setApellidos(apellido);
											String mensaje="Bienvenido a la comunidad <br>" +
													"Tu usuario es "+usuario+"<br>" +
															"Tu contraseña es "+password+"<br>" +
																	"Esperamos verte Pronto!";
			
			try {
				if(UtilBasesUsuario.UpdateUsuario(Datos))
				{
					Mail.sendMail("Datos Modificados", mensaje,Datos.getEmail());
					System.out.println("Datos guardados!!!");
						request.getSession().setAttribute("nombreUsuario",Datos.getUsuario() );
						response.sendRedirect("ServletPortada?id="+Datos.getId());
					}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
