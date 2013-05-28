package data;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class UtilBasesClan {

	private static String regex="-*$#*-";

	public static int ultimoId() throws ClassNotFoundException{
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test= "Select MAX(id) AS id from clan";
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

	public static boolean usuariosClan(int id) throws ClassNotFoundException {
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test= "select usuario.id, usuario.usuario from (usuario join clan on usuario.clan_id=clan.id) where clan.id="+id;
			System.out.println(test);		
			ResultSet a=conection.ejecutarQuery(test);
			List<String> lista = new ArrayList<String>();  
			while(a.next()){
					lista.add(""+a.getInt(1)+regex+""+a.getString(2));
				}
				util.ArregloDeDatos.UsuariosClan=lista;
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}

	public static boolean cargarClanes() throws ClassNotFoundException {
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test= "select usuario.id, usuario.usuario, clan.* from clan join usuario on clan.creador=usuario.id order by clan.ganadas";
			System.out.println(test);		
			ResultSet a=conection.ejecutarQuery(test);
			List<String> lista = new ArrayList<String>();
			String dato="";
			while(a.next()){
				//
				dato=""+a.getInt(1)+regex+""+a.getString(2)+regex+a.getInt(7)+regex+a.getString(3)+regex+""+a.getString(4)+regex+""+a.getString(6)+regex+""+a.getInt(8)+regex+""+a.getInt(9)+regex+""+a.getInt(10)+regex+""+a.getString(11)+regex+""+a.getInt(12);
					lista.add(dato);
				}
			//for(int x=0;x<1000;x++)
				//lista.add(dato);
				util.ArregloDeDatos.TodosClanes=lista;
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}

	public static boolean cargarInformacionClan(int id) throws ClassNotFoundException {
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test= "select clan.*,usuario.id,usuario.usuario from  clan join usuario on clan.creador=usuario.id where clan.id="+id;
			System.out.println(test);		
			ResultSet a=conection.ejecutarQuery(test);
			List<String> lista = new ArrayList<String>();
			String dato="";
			while(a.next()){
				//
				lista.add(""+a.getInt(5));
				lista.add(""+a.getString(1));
				lista.add(""+a.getString(2));
				lista.add(""+a.getString(4));
				lista.add(""+a.getString(9));
				lista.add(""+a.getInt(10));
				lista.add(""+a.getInt(11));
				lista.add(""+a.getString(12));
				
				
				
				}
			//for(int x=0;x<1000;x++)
				//lista.add(dato);
				util.ArregloDeDatos.InfoClan=lista;
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}

	public static String cargarCreadorClan(String string) throws ClassNotFoundException {
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test= "select creador from clan where id="+string;
			System.out.println(test);		
			ResultSet a=conection.ejecutarQuery(test);
			List<String> lista = new ArrayList<String>();
			String dato="";
			while(a.next()){
				//
				dato=a.getInt(1)+"";
				}
			//for(int x=0;x<1000;x++)
				//lista.add(dato);
				util.ArregloDeDatos.InfoClan=lista;
			return dato;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "";
		}
	}
}