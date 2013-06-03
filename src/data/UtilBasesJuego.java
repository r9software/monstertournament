package data;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.ArregloDeDatos;



public class UtilBasesJuego {
	

	private static String regex="-.....-";
	public static int ultimoId() throws ClassNotFoundException{
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test= "Select MAX(id) AS id from juego";
			System.out.println(test);		
			ResultSet a=conection.ejecutarQuery(test);
			
			int numero=0;
			while(a.next()){
				numero=a.getInt(1);
			}

					
			
				
			return numero;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public static boolean ultimos10Juegos() throws ClassNotFoundException {
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test= "select juego.id, juego.nombre FROM juego ORDER BY RAND() LIMIT 10";
			System.out.println(test);		
			ResultSet a=conection.ejecutarQuery(test);
			List<String> lista = new ArrayList<String>();  
			while(a.next()){
					lista.add(""+a.getInt(1)+regex+""+a.getString(2));
				}
				util.ArregloDeDatos.ImagenesPie=lista;
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}

	public static boolean cargarJuegos() throws ClassNotFoundException {
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test= "select juego.id, juego.nombre, juego.video FROM juego ORDER BY RAND()";
			System.out.println(test);		
			ResultSet a=conection.ejecutarQuery(test);
			String dato="";
			List<String> lista = new ArrayList<String>();  
			while(a.next()){
				dato=""+a.getInt(1)+regex+""+a.getString(2)+regex+""+a.getString(3);
					lista.add(dato);
				}
				//for(int x=0;x<1000;x++)
				//	lista.add(dato);
				util.ArregloDeDatos.TodosJuegos=lista;
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}
	public static boolean cargarIdJuegos(int id) throws ClassNotFoundException {
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test= "	select juego_id from juego_has_usuario where usuario_id="+id;
			System.out.println(test);		
			ResultSet a=conection.ejecutarQuery(test);
			String dato="";
			List<String> lista = new ArrayList<String>();  
			while(a.next()){
				dato=""+a.getInt(1);
					lista.add(dato);
				}
				//for(int x=0;x<1000;x++)
				//	lista.add(dato);
				util.ArregloDeDatos.juegosUsuario=lista;
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}

	public static boolean cargarJuego(int id) throws ClassNotFoundException {
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test= "select juego.*, usuario.id, usuario.usuario from juego join usuario on usuario.id=juego.idusuario where juego.id="+id;
			System.out.println(test);		
			ResultSet a=conection.ejecutarQuery(test);
			String dato="";
			List<String> lista = new ArrayList<String>();  
			while(a.next()){
				lista.add(""+a.getInt(1));
				lista.add(a.getString(2));
				lista.add(a.getString(3));
				lista.add(a.getString(4));
				lista.add(a.getString(5));
				lista.add(a.getString(6));
				lista.add(a.getString(7));
				lista.add(a.getString(8));
				lista.add(a.getString(9));
				lista.add(a.getString(10));
				lista.add(a.getString(11));
				lista.add(a.getString(15));
				lista.add(""+a.getInt(16));
				lista.add(a.getString(17));
				
				}
				//for(int x=0;x<1000;x++)
				//	lista.add(dato);
				util.ArregloDeDatos.datosJuego=lista;
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	public static boolean tengojuego(int id) {
		List<String> lista=ArregloDeDatos.juegosUsuario;
		for(int x=0;x<lista.size();x++) 
		{
			if(String.valueOf(id).equals(lista.get(x)))
				return true;
		}	
		return false;
	}
}