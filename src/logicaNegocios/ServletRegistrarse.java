package logicaNegocios;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.ProcessBuilder.Redirect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.UtilBasesUsuario;

import bean.UsuarioBean;
import util.Util;

/**
 * Servlet implementation class registrarse
 */
@WebServlet("/ServletRegistrarse")
public class ServletRegistrarse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletRegistrarse() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			registrarUsuario(request,response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void registrarUsuario(HttpServletRequest request,HttpServletResponse response)  throws ServletException, IOException, ClassNotFoundException{
		String cadena_ingresada = request.getParameter("captcha");
		HttpSession session_nueva = request.getSession(true);
		String key = (String) session_nueva.getAttribute("key");
		if(cadena_ingresada.equals(key)){
		String usuario;
		String email;
		String nombre;
		String apellido;
		String password;
		
		usuario=request.getParameter("usuario");
		email=request.getParameter("email");
		nombre=request.getParameter("nombre");
		apellido=request.getParameter("apellidos");
		//if(request.getParameter("sp").equals("si")){
		//password=Util.crearContraseña();
		//System.out.println(password);
		//}
		//else{
		password=request.getParameter("pas");
		//}
			
		UsuarioBean Datos= new UsuarioBean();
		Datos.setUsuario(usuario);
				Datos.setPassword(password);
						Datos.setEmail(email);
								Datos.setNombre(nombre);
										Datos.setApellidos(apellido);
										String mensaje="Bienvenido a la comunidad <br>" +
												"Tu usuario es "+usuario+"<br>" +
														"Tu contraseña es "+password+"<br>" +
																"Esperamos verte Pronto!";
		
		if(UtilBasesUsuario.registrarUsuario(Datos))
		{
			//Mail.sendMail("Bienvenido", mensaje,Datos.getEmail());
			System.out.println("Datos guardados!!!");
			int numero=0;
			numero=UtilBasesUsuario.ultimoId();
			if(numero!=0){
				request.getSession().setAttribute("nombreUsuario",Datos.getUsuario() );
				request.getSession().setAttribute("idUsuario",numero);
				response.sendRedirect("ServletPortada?id="+numero);
			}
			else{
			response.sendRedirect("ServletPortada?logout=true");
			}
			}
		}
		else{
			devolverPagina(response);
		}
	}
	public void devolverPagina(HttpServletResponse rsp){
		rsp.setContentType("text/html");
		PrintWriter out= null;
		try {
			out= rsp.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.println("<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>"+
		"<html>"+
		"<head>"+
		"<meta http-equiv='Content-Type' content='text/html; charset=ISO-8859-1'>"+
		"<title>Error</title>"+
		"</head>"+
		"<body>"+
		"<h1>El captcha es incorrecto regrese por favor y modifiquelo</h1>"+
		"</body>"+
		"</html>");
		
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}

