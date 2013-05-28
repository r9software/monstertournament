package logicaNegocios;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UsuarioBean;

import data.UtilBasesUsuario;

import util.Util;

/**
 * Servlet implementation class servletController
 */
@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String user;

    /**
     * Default constructor. 
     */
    public ServletLogin() {
        // TODO Auto-generated constructor stub
    	System.out.println("Estado---> iniciado");
    }

    protected void autenticar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException 
    
    {
    	user= request.getParameter("username");
		String pwd= request.getParameter("pwd");
		System.out.println("Codificación de los carácteres del cliente: "+request.getCharacterEncoding());
		System.out.println("Context path"+request.getContextPath());
		
		UsuarioBean tipo= new UsuarioBean();
			System.out.println("Voy a comprobar usuario");
				tipo=UtilBasesUsuario.comprobarUsuario(user,pwd);
		if(tipo!=null)
		{
			devolverPagina(request,response,tipo);
			// response.getWriter().println("Desde get: Hola, "+user);
		}
		else{
			System.out.println("Saldrá error 404 inicio mal");
			String error="Usuario y/o password Incorrectos";
			request.getSession().setAttribute("errorLogin",error);
			response.sendRedirect("index.jsp");
		}
		
    	
    }
    public void devolverPagina(HttpServletRequest request,HttpServletResponse rsp,UsuarioBean tipo){
		rsp.setContentType("text/html");
		/*
		 * PrintWriter out= null;
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
		"<title>Bienvenido</title>"+
		"</head>"+
		"<body>"+
		"<h1> Bienvenido "+user+"</h1>"+
		"</body>"+
		"</html>");*/
		try {
			request.getSession().setAttribute("nombreUsuario",tipo.getUsuario() );
			request.getSession().setAttribute("idUsuario",tipo.getId() );
			request.getSession().setAttribute("avatarUsuario",tipo.getAvatar());
			System.out.println(tipo.getUsuario());
			rsp.sendRedirect("ServletPortada?id="+tipo.getId());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 
	 * 
	 */
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
				
		try {
			autenticar(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				
		try {
			autenticar(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
