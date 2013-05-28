package logicaNegocios;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import data.UtilBasesUsuario;

/**
 * Servlet implementation class ServletSubirImagen
 */
@WebServlet("/ServletSubirImagen")
public class ServletSubirImagen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletSubirImagen() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
		 
	}
	 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException {
			 // si se quiere comprobar que es un request de ficheros
			 //boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			 response.setContentType("text/html");
			 PrintWriter out = response.getWriter();

			 boolean flag = false;
			 String fileName = "";
			 List fileItems = null;
			 String path = getServletContext().getRealPath("/")+"system/images/avatar/";
			 String rutaFichero="";

			 try {
			 // construimos el objeto que es capaz de parsear la perición
			 DiskFileItemFactory factory = new DiskFileItemFactory(); 

			 // tamaño por encima del cual los ficheros son escritos directamente en disco
			 factory.setSizeThreshold(4096);
			 // directorio en el que se escribirán los ficheros con tamaño superior al soportado en memoria
			 factory.setRepository(new File(path + "/"));

			 // nuevo manejador para el fichero
			 ServletFileUpload upload = new ServletFileUpload(factory);
			 // maximo numero de bytes
			 upload.setSizeMax(1024*512);
			 // ordenamos procesar los ficheros
			 fileItems = upload.parseRequest(request);
			 if (fileItems == null) {
			 flag=false;
			 }
			 // Iteramos por cada fichero
			 Iterator i = fileItems.iterator();
			 FileItem actual = null;

			 if (i.hasNext()) {

			 actual = (FileItem) i.next();
			 fileName= actual.getName(); 
			 File fichero=null;
			 // construimos un objeto file para recuperar el trayecto completo
					 if(fileName.contains(".png")||fileName.contains(".PNG")||fileName.contains(".jpg")||fileName.contains(".JPG")||fileName.contains(".JPEG")||fileName.contains(".jpeg")||fileName.contains(".bmp")||fileName.contains(".gif")){
					  fichero= new File(fileName);
					// nos quedamos solo con el nombre y descartamos el path
						 fichero = new File(path + fichero.getName());
						 // escribimos el fichero colgando del nuevo path
						 actual.write(fichero);
						 rutaFichero=fichero.getName();
						 UtilBasesUsuario.actualizarAvatar(request.getSession().getAttribute("idUsuario").toString(),fichero.getName());
						  request.getSession().setAttribute("avatarUsuario","images/avatar/"+fichero.getName());
					  flag = true;
					  
					 }
			 }
			 } catch (Exception e) {
			 out.println(e.getMessage());
			 }

			 //////////////////////////////////////////////////////////////////////////////////////

			 request.setAttribute("subido", flag);
			 request.getRequestDispatcher( "/perfil.jsp" ).forward( request, response );

			 out.close();
			 }
	 

}
