package util;

import java.io.BufferedReader;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.*;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.ConexionMYSQL;


public class Util {
	public static boolean comprobarUsuario(String usuario, String password){
		 File archivo = null;
	        FileReader fr = null;
	        BufferedReader br = null;

	        String linea = null;

	        try {
	            //Cargamos el archivo de la ruta relativa
	        	 URL ruta= Util.class.getProtectionDomain().getCodeSource().getLocation();
	             System.out.println(ruta);
	             String Ruta=ruta.toString();
	             Ruta=Ruta.substring(6,Ruta.length()-10);
	             Ruta=Ruta.replace('/','\\');
	      		archivo = new File(Ruta+"usuarios.txt");
	            //Cargamos el objeto FileReader
	            fr = new FileReader(archivo);
	            //Creamos un buffer de lectura
	            br = new BufferedReader(fr);

	            String[] datos = null;

	            //Leemos hasta que se termine el archivo
	            while ((linea = br.readLine()) != null) {

	                //Utilizamos el separador para los datos
	                datos = linea.split(";");
	                //Presentamos los datos
	                System.out.println("El usuario "+ datos[0] + " password " + datos[1] + "");
	                if(datos[0].equals(usuario)&&datos[1].equals(password)){
	                	return true;
	                }
	            }

	            //Capturamos las posibles excepciones
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (fr != null) {
	                    fr.close();
	                }
	            } catch (Exception e2) {
	                e2.printStackTrace();
	            }
	        }

	    
		return false;
	}
	public static String comprobarUsuarioMYSQL(String usuario,String Password) throws ClassNotFoundException{
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test= "Select tipo from usuarios where usuario='"+usuario+"' and pass='"+Password;
			System.out.println(test);		
			ResultSet a=conection.ejecutarQuery("Select tipo from usuarios where usuario='"+usuario+"' and pass='"+Password+"'");
			
			String Usuario= null;
				while(a.next()){
				Usuario=a.getString(1);
				}
			return Usuario;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	public static String[] comprobarUsuario(String correo){
		 File archivo = null;
	        FileReader fr = null;
	        BufferedReader br = null;

	        String linea = null;

	        try {
	            //Cargamos el archivo de la ruta relativa
	        	 URL ruta= Util.class.getProtectionDomain().getCodeSource().getLocation();
	             System.out.println(ruta);
	             String Ruta=ruta.toString();
	             Ruta=Ruta.substring(6,Ruta.length()-10);
	             Ruta=Ruta.replace('/','\\');
	      		archivo = new File(Ruta+"usuarios.txt");
	            //Cargamos el objeto FileReader
	            fr = new FileReader(archivo);
	            //Creamos un buffer de lectura
	            br = new BufferedReader(fr);

	            String[] datos = null;

	            //Leemos hasta que se termine el archivo
	            while ((linea = br.readLine()) != null) {

	                //Utilizamos el separador para los datos
	                datos = linea.split(";");
	                //Presentamos los datos
	                System.out.println("El usuario "+ datos[0] + " password " + datos[1] + "");
	                if(datos[2].equals(correo)){
	                	return datos;
	                }
	            }

	            //Capturamos las posibles excepciones
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (fr != null) {
	                    fr.close();
	                }
	            } catch (Exception e2) {
	                e2.printStackTrace();
	            }
	        }

	    
		return null;
	}
	public static boolean guardarUsuario(String[] Datos) { 
		
		File f;
       URL ruta= Util.class.getProtectionDomain().getCodeSource().getLocation();
       System.out.println(ruta);
       String Ruta=ruta.toString();
       Ruta=Ruta.substring(6,Ruta.length()-10);
       Ruta=Ruta.replace('/','\\');
		f = new File(Ruta+"usuarios.txt");
		System.out.println(f.getAbsolutePath());
		try{
		FileWriter w = new FileWriter(f);
		BufferedWriter bw = new BufferedWriter(w);
		PrintWriter wr = new PrintWriter(bw);  
		System.out.println(Datos[0]+";"+Datos[1]+";"+Datos[2]+";"+Datos[3]+";"+Datos[4]+";");
		wr.write(Datos[0]+";"+Datos[1]+";"+Datos[2]+";"+Datos[3]+";"+Datos[4]+";"); //concatenamos en el archivo sin borrar lo existente
		        //ahora cerramos los flujos de canales de datos, al cerrarlos el archivo quedará guardado con información escrita
		        //de no hacerlo no se escribirá nada en el archivo
		wr.close();
		bw.close();
		w.close();
		return true;
		}catch(IOException e){};
		return false;
		}
	public static String crearContraseña() {
		String pwd="";
		String base = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@!#$";
		int longitud = base.length();
		for(int i=0; i<8;i++){ 
		    int numero = (int)(Math.random()*(longitud)); 
		    String caracter=base.substring(numero, numero+1); 
		    pwd=pwd+caracter; 
		}
		return pwd;
	}
	public static boolean enviarCorreo(String[] datos) {
		
		
		
		return false;
		// TODO Auto-generated method stub
		
	}

}
