package util;
import java.security.Security;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class prueba {
	public static void main(String[] args) {
	
		
		  
		   String Datos[]= new String[5];
		   Datos[0]="angel";
		   Datos[1]="angel";
		   Datos[2]="angel";
		   Datos[3]="angel";
		   Datos[4]="r9dolfinho@hotmail.com";
		   String mensaje="Nombre de Usuario: "+Datos[0]+"\n Pass: "+Datos[1]+"Nombre: "+Datos[3]+"Apellido: "+Datos[4];
		  if(Mail.sendMail("Asunto del Mensaje",mensaje,Datos[4])){
		   
		   System.out.println("envío Correcto");
		    
		  }else System.out.println("envío Fallido");
		 
		 }

}
