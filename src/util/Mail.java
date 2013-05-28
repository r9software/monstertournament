package util;
import java.security.Security;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class Mail {
	 @SuppressWarnings("finally")
	public static synchronized  boolean sendMail(String titulo, String mensaje, String paraEmail) {
		  boolean envio=false;
		   
		  try {
		    
		   //carga del archivo smtp.properties
		   //final ResourceBundle  props = ResourceBundle.getBundle("util.resource");
		    System.out.println("mierda");
		   //int addProvider = Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
		    
		   //Propiedades de la conexion
		   Properties propiedades = new Properties();
		   propiedades.setProperty("mail.transport.protocol","smtp");
		   propiedades.setProperty("mail.smtp.host","smtp.gmail.com");
		   propiedades.put("mail.smtp.auth","true");
		   propiedades.put("mail.smtp.port","587");
		   propiedades.put("mail.smtp.socketFactory.port","587");
		   propiedades.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		   propiedades.put("mail.smtp.socketFactory.fallback","false");
		   propiedades.put("mail.smtp.mail.sender","r9software@gmail.com");
		    
		   propiedades.setProperty("mail.smtp.quitwait","false");
		    
		   //Preparamos la Sesion autenticando al usuario
		   System.out.println("va bien");
		   Session session = Session.getDefaultInstance(propiedades,new javax.mail.Authenticator() {
		    protected PasswordAuthentication getPasswordAuthentication(){
		    	 System.out.println("sientro");
		     return new PasswordAuthentication("r9software@gmail.com","luisronaldo");
		    }
		   });
		    
		   //Preparamos el Mensaje
		   MimeMessage message = new MimeMessage(session);
		   message.setSender(new InternetAddress("r9software@gmail.com"));
		   message.setSubject(titulo);
		   message.setContent(mensaje, "text/html; charset=utf-8");
		   message.setFrom(new InternetAddress("r9software@gmail.com"));
		   message.setReplyTo(InternetAddress.parse("r9software@gmail.com"));
		   
		   
		   if (paraEmail.indexOf(',') > 0)
		    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(paraEmail));
		   else
		    message.setRecipient(Message.RecipientType.TO, new InternetAddress(paraEmail));
		    
		   //envío del mensaje
		   Transport.send(message);
		   envio = true;
		   
		  } catch (Throwable e) {
		   envio = false;
		   System.out.println(e.getMessage());
		   e.printStackTrace();
		   
		  }finally{
		   return envio;
		  }

			
		 }
}
