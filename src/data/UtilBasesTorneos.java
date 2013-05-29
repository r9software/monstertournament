package data;

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
import java.util.ArrayList;
import java.util.List;

import bean.UsuarioBean;


public class UtilBasesTorneos {

	private static String regex="-*****-";

	public static int ultimoId() throws ClassNotFoundException{
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test= "Select MAX(id) AS id from torneo";
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

	public static boolean cargar10Torneos() throws ClassNotFoundException {
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test= "select usuario.id, usuario.nombre, torneo.id, torneo.nombre, torneo.descripcion " +
					"from  (usuario join torneo "  +
					" on torneo.usuario_id=usuario.id) where activo=1 order by torneo.fechatermino DESC limit 0,10";
			System.out.println(test);		
			ResultSet a=conection.ejecutarQuery(test);
			List<String> lista = new ArrayList<String>();  
			while(a.next()){
					lista.add(""+a.getInt(1)+regex+""+a.getString(2)+regex+a.getInt(3)+regex+a.getString(4)+regex+a.getString(5));
				}
				util.ArregloDeDatos.Ultimos10Torneos=lista;
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}
	public static boolean cargarTorneos() throws ClassNotFoundException {
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test= "select juego.id, juego.nombre, torneo.id," +
					" torneo.nombre, torneo.descripcion, torneo.participantes," +
					" usuario.id, usuario.usuario, administrador.id, " +
					" administrador.usuario, premio.id, premio.descripcion" +
					" from ((((torneo join premio on premio.id=torneo.premio_id)" +
					" join juego on juego.id=torneo.juego_id)" +
					" join administrador on administrador.id=torneo.administrador_id)" +
					" join usuario on usuario.id=torneo.usuario_id) where activo=1 order by torneo.fechatermino DESC limit 0,100";
			System.out.println(test);		
			ResultSet a=conection.ejecutarQuery(test);
			String dato="";
			List<String> lista = new ArrayList<String>();  
			while(a.next()){
					dato=""+a.getInt(1)+regex+""+a.getString(2)+regex+a.getInt(3)+regex
							+a.getString(4)+regex+a.getString(5)+regex+a.getInt(6)+regex
					        +a.getInt(7)+regex+a.getString(8)+regex+a.getInt(9)+regex
							+a.getString(10)+regex+a.getInt(11)+regex+a.getString(12);
							lista.add(dato);
				}
			//for(int x=0;x<100;x++)
				//lista.add(dato);
				util.ArregloDeDatos.UltimosTorneos=lista;
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}
	//cargarPartidasid
	//select tipo.nombre,usuario.id,usuario.nombre,partida.fecha, partida.participantes,partida.ronda from ((partida join torneo on partida.torneo_id=torneo.id) join usuario on partida.ganador=usuario.id)join tipo on partida.tipo=tipo.id where torneo.id=1;

	public static boolean activo(String id) throws ClassNotFoundException {
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test= "select activo from torneo where id="+id;
			System.out.println(test);		
			ResultSet a=conection.ejecutarQuery(test);
			String dato="";
			List<String> lista = new ArrayList<String>();  
			while(a.next()){
				if(a.getInt(1)==1)
					return true;
				}
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	public static boolean cargarPartidas(String id) throws ClassNotFoundException {
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test= "select tipo.nombre,usuario.id,usuario.nombre," +
					"partida.fecha, partida.participantes,partida.ronda" +
					" from ((partida join torneo on partida.torneo_id=torneo.id) " +
					"join usuario on partida.ganador=usuario.id) " +
					"join tipo on partida.tipo=tipo.id where torneo.id="+id;
;
			System.out.println(test);		
			ResultSet a=conection.ejecutarQuery(test);
			String dato="";
			List<String> lista = new ArrayList<String>();  
			while(a.next()){
					dato=""+a.getString(1)+regex+""+a.getInt(2)+regex+a.getString(3)+regex
							+a.getString(4)+regex+a.getInt(5)+regex+a.getInt(6);
					        
							lista.add(dato);
				}
			//for(int x=0;x<100;x++)
				//lista.add(dato);
				util.ArregloDeDatos.PartidasTorneo=lista;
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}


	public static boolean cargarTorneo(String id) throws ClassNotFoundException {
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test= "select juego.id, juego.nombre, torneo.id," +
					" torneo.nombre, torneo.descripcion, torneo.participantes," +
					" usuario.id, usuario.usuario, administrador.id, " +
					" administrador.usuario, premio.id, premio.descripcion" +
					" from ((((torneo join premio on premio.id=torneo.premio_id)" +
					" join juego on juego.id=torneo.juego_id)" +
					" join administrador on administrador.id=torneo.administrador_id)" +
					" join usuario on usuario.id=torneo.usuario_id) where torneo.id="+id;
			System.out.println(test);		
			ResultSet a=conection.ejecutarQuery(test);
			String dato="";
			List<String> lista = new ArrayList<String>();  
			while(a.next()){
					dato=""+a.getInt(1)+regex+""+a.getString(2)+regex+a.getInt(3)+regex
							+a.getString(4)+regex+a.getString(5)+regex+a.getInt(6)+regex
					        +a.getInt(7)+regex+a.getString(8)+regex+a.getInt(9)+regex
							+a.getString(10)+regex+a.getInt(11)+regex+a.getString(12);
							lista.add(a.getInt(1)+"");
							lista.add(a.getString(2));
							lista.add(a.getInt(3)+"");
							lista.add(a.getString(4));
							lista.add(a.getString(5));
							lista.add(a.getInt(6)+"");
							lista.add(a.getInt(7)+"");
							lista.add(a.getString(8));
							lista.add(a.getInt(9)+"");
							lista.add(a.getString(10));
							lista.add(a.getInt(11)+"");
							lista.add(a.getString(12));
							
				}
			//for(int x=0;x<100;x++)
				//lista.add(dato);
				util.ArregloDeDatos.TorneoInfo=lista;
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}
}