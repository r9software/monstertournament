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

import util.ArregloDeDatos;

import bean.UsuarioBean;


public class UtilBasesUsuario {
	private static String regex="-*****-";
	public static UsuarioBean comprobarUsuario(String usuario,String Password) throws ClassNotFoundException{
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test= "Select * from usuario where usuario='"+usuario+"' and password='"+Password+"'"; 
			System.out.println(test);		
			ResultSet a=conection.ejecutarQuery(test);
			
			UsuarioBean auser=null;
			
			
				while(a.next()){
					auser= new UsuarioBean(a.getInt(1),a.getString(2), a.getString(3),a.getString(4), a.getString(5),a.getString(6),a.getString(7), a.getInt(8), a.getInt(9),a.getInt(10),a.getInt(11));
				}
			return auser;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	public static boolean registrarUsuario(UsuarioBean datos)throws ClassNotFoundException{
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			
			String test= "INSERT INTO usuario (`usuario`, `email`, `password`, `nombre`, `apellidos`)  VALUES('"+datos.getUsuario()+"','"+datos.getEmail()+"','"+datos.getPassword()+"','"+datos.getNombre()+"','"+datos.getApellidos()+"')";
			System.out.println(test);		
			conection.ejecutarInsert(test);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}

	public static int ultimoId() throws ClassNotFoundException{
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test= "Select MAX(id) AS id from usuario";
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

	public static boolean cargarTorneos(int id) throws ClassNotFoundException {
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test= "select torneo.id, torneo.nombre, torneo.descripcion, torneo.juego_id " +
					"from  (usuario join usuario_has_torneo on usuario_has_torneo.usuario_id=usuario.id)" +
					" join torneo on usuario_has_torneo.torneo_id=torneo.id where usuario.id="+id+" order by torneo.fechatermino DESC";
			System.out.println(test);		
			ResultSet a=conection.ejecutarQuery(test);
			List<String> lista = new ArrayList<String>();  
			while(a.next()){
					
				lista.add(""+a.getInt(1)+regex+""+a.getString(2)+regex+a.getString(3)+regex+a.getInt(4));
					
				}
				util.ArregloDeDatos.TorneosUsuario=lista;
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}

	public static boolean cargarAmigos(int id) throws ClassNotFoundException {
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test=" select usuario.id, usuario.usuario, usuario.avatar,usuario.ganadas " +
					" from  (usuario join usuario_has_usuario" +
					" on usuario_has_usuario.usuario_id1=usuario.id)" +
					" where usuario_has_usuario.usuario_id="+id;
			System.out.println(test);		
			ResultSet a=conection.ejecutarQuery(test);
			List<String> lista = new ArrayList<String>();  
			while(a.next()){
					lista.add(""+a.getInt(1)+regex+""+a.getString(2)+regex+""+a.getString(3)+regex+""+a.getInt(4));
				}
				util.ArregloDeDatos.AmigosUsuario=lista;
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}
	public static boolean cargarIdAmigos(String id) throws ClassNotFoundException {
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test=" select usuario.id " +
					" from  (usuario join usuario_has_usuario" +
					" on usuario_has_usuario.usuario_id1=usuario.id)" +
					" where usuario_has_usuario.usuario_id="+id;
			System.out.println(test);		
			ResultSet a=conection.ejecutarQuery(test);
			List<String> lista = new ArrayList<String>();  
			while(a.next()){
					lista.add(""+a.getInt(1));
				}
				util.ArregloDeDatos.IdAmigos=lista;
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}
	public static boolean cargarAmigosconClan(int id) throws ClassNotFoundException {
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test=" select usuario.id, usuario.usuario, usuario.avatar," +
					"usuario.ganadas,usuario.perdidas,usuario.empatadas," +
					"clan.id,clan.nombre" +
					" from  (usuario join usuario_has_usuario" +
					" on usuario_has_usuario.usuario_id1=usuario.id) left join clan on clan.id=usuario.clan_id" +
					" where usuario_has_usuario.usuario_id="+id;
			System.out.println(test);		
			ResultSet a=conection.ejecutarQuery(test);
			List<String> lista = new ArrayList<String>();
			String dato = null;
			while(a.next()){
					dato=""+a.getInt(1)+regex+""+a.getString(2)+regex+""+a.getString(3)+regex+""+a.getInt(4)+regex+""+a.getInt(5)+regex+""+a.getInt(6)+regex+""+a.getInt(7)+regex+""+a.getString(8);
					lista.add(dato);
				}
			//for(int x=0;x<100;x++)
				//lista.add(dato);
				util.ArregloDeDatos.AmigosUsuario=lista;
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}
	public static boolean cargarJuegos(int id)  throws ClassNotFoundException {
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test= "select juego.id, juego.nombre, juego.descripcion " +
					" from  (usuario join juego_has_usuario" +
					" on juego_has_usuario.usuario_id=usuario.id)" +
					"  join juego on juego_has_usuario.juego_id=juego.id where usuario.id="+id;
			System.out.println(test);		
			ResultSet a=conection.ejecutarQuery(test);
			List<String> lista = new ArrayList<String>();  
			while(a.next()){
					lista.add(""+a.getInt(1)+regex+""+a.getString(2)+regex+""+a.getString(3));
				}
				util.ArregloDeDatos.JuegosUsuario=lista;
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	public static boolean UltimasPartidas(int id) throws ClassNotFoundException {
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			String test= "select torneo.id, torneo.nombre, partida.id, partida.ronda, usuario_has_partida.posicion, torneo.descripcion " +
					"from  ((usuario join usuario_has_partida " +
					" on usuario_has_partida.usuario_id=usuario.id) " +
					" join partida on partida.id=usuario_has_partida.partida_id) " +
					"join torneo on partida.torneo_id=torneo.id where usuario.id="+id+" order by torneo.fechatermino DESC";
			System.out.println(test);		
			ResultSet a=conection.ejecutarQuery(test);
			List<String> lista = new ArrayList<String>();  
			while(a.next()){
					lista.add(""+a.getInt(1)+regex+""+a.getString(2)+regex+a.getInt(3)+regex+a.getInt(4)+regex+a.getInt(5)+regex+a.getString(6));
				}
				util.ArregloDeDatos.PartidasUsuario=lista;
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}
	

		public static boolean cargarClan(int id) throws ClassNotFoundException {
			ConexionMYSQL conection = new ConexionMYSQL();
			try {
				conection.abrirConexion();
				String test=" select clan.id, clan.nombre from (usuario join clan on usuario.clan_id=clan.id) where usuario.id="+id;
				System.out.println(test);		
				ResultSet a=conection.ejecutarQuery(test);
				String lista = null;  
				while(a.next()){
						lista=""+a.getInt(1)+regex+""+a.getString(2);
					}
					util.ArregloDeDatos.clan=lista;
				return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
	}

		public static int obtenerIdClan(int id) throws ClassNotFoundException {
			int idClan=0;
			ConexionMYSQL conection = new ConexionMYSQL();
			try {
				conection.abrirConexion();
				String test="			select clan_id from usuario where id="+id;
				System.out.println(test);		
				ResultSet a=conection.ejecutarQuery(test);
				String lista = null;  
				while(a.next()){
						idClan=a.getInt(1);
					}
				return idClan;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
			return idClan;
		}

			
		public static boolean allUsuarios() throws ClassNotFoundException {
			ConexionMYSQL conection = new ConexionMYSQL();
			try {
				conection.abrirConexion();
				String test="select usuario.id,usuario.usuario,usuario.avatar,usuario.ganadas,usuario.perdidas,usuario.empatadas,usuario.clan_id,usuario.torneosganados,clan.nombre from usuario left join clan on clan.id=usuario.clan_id order by usuario.ganadas DESC";
				System.out.println(test);	  	
				ResultSet a=conection.ejecutarQuery(test);
				String dato = "";
				List<String> lista = new ArrayList<String>();  
				while(a.next()){
						dato=""+a.getInt(1)+regex+""+a.getString(2)+regex+""+a.getString(3)+regex+""+a.getInt(4)+regex+""+a.getInt(5)+regex+""+a.getInt(6)+regex+a.getInt(7)+regex+""+a.getInt(8)+regex+a.getString(9);
						if(!Amistad(a.getInt(1)+""))
						{
							lista.add(dato);	
						}
						
					}
					/*for(int x=0;x<100;x++)
						lista.add(dato);*/
					util.ArregloDeDatos.TodosUsuarios=lista;
					
				return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}	
			
		}
		public static boolean actualizarAvatar(String attribute, String name) throws ClassNotFoundException {
			ConexionMYSQL conection = new ConexionMYSQL();
			try {
				conection.abrirConexion();
				String test="UPDATE `torneosplay`.`usuario` SET `avatar`='images/avatar/"+name+"' WHERE `id`="+attribute;

				System.out.println(test);	  	
				int a=conection.ejecutarUpdate(test);
				return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
			
		}

		public static boolean CargarDatosUsuario(String id) throws ClassNotFoundException {
			// TODO Auto-generated method stub
			ConexionMYSQL conection = new ConexionMYSQL();
			try {
				conection.abrirConexion();
				String test="select * from usuario where id="+id;
				System.out.println(test);	  	
				ResultSet a=conection.ejecutarQuery(test);
				String dato = "";
				List<String> lista = new ArrayList<String>();  
				while(a.next()){
						lista.add(""+a.getInt(1));
						lista.add(a.getString(2));
						lista.add(a.getString(3));
						lista.add(a.getString(4));
						lista.add(a.getString(5));
						lista.add(a.getString(6));
						lista.add(a.getString(7));
						lista.add(""+a.getInt(8));
						lista.add(""+a.getInt(9));
						lista.add(""+a.getInt(10));
						lista.add(""+a.getInt(11));
						lista.add(""+a.getInt(12));
				}
					/*for(int x=0;x<100;x++)
						lista.add(dato);*/
					util.ArregloDeDatos.DatosUsuario=lista;
					
				return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}

		public static boolean UpdateUsuario(UsuarioBean datos) throws ClassNotFoundException {
			ConexionMYSQL conection = new ConexionMYSQL();
			try {
				conection.abrirConexion();
				String test="UPDATE `torneosplay`.`usuario` SET `usuario`='"+datos.getUsuario()+"',`nombre`='"+datos.getNombre()+"',`apellidos`='"+datos.getApellidos()+"',`password`='"+datos.getPassword()+"'  WHERE `id`="+datos.getId();
				System.out.println(test);	  	
				int a=conection.ejecutarUpdate(test);
				return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}
		

		public static String cargarNombre(int id) throws ClassNotFoundException {
			ConexionMYSQL conection = new ConexionMYSQL();
			try {
				conection.abrirConexion();
				String test="select usuario from usuario where id="+id;
				System.out.println(test);	  	
				ResultSet a=conection.ejecutarQuery(test);
				String dato = "";
				while(a.next()){
						dato=a.getString(1);
				}
					/*for(int x=0;x<100;x++)
						lista.add(dato);*/
					
				return dato;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "";
			}
			
		}
		public static boolean Amistad(String id){
			List<String> ids=ArregloDeDatos.IdAmigos;
			for(int x=0;x<ids.size();x++)
			{
				System.out.println("ids:"+ids.get(x)+"id");
				if(ids.get(x).equals(id))
					return true;
			}
			return false;
			
		}

		public static boolean SolicitarAmistad(String idamigo, String idusuario,
				String mensaje, String web, String email, String asunto) throws ClassNotFoundException {
			// TODO Auto-generated method stub
			ConexionMYSQL conection = new ConexionMYSQL();
			try {
				conection.abrirConexion();
				
				String test= "INSERT INTO `torneosplay`.`solicitud_amigo`	(`idusuario`,`idamigo`,`nombre`,`email`,`sitio`,`mensaje`)  VALUES('"+idusuario+"','"+idamigo+"','"+asunto+"','"+email+"','"+web+"','"+mensaje+"')";
				System.out.println(test);		
				conection.ejecutarInsert(test);
				return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return false;
			
		}
}
//	public static boolean guardarDatos(UsuarioBean datos) throws ClassNotFoundException{
//		ConexionMYSQL conection = new ConexionMYSQL();
//		try {
//			conection.abrirConexion();
//			
//			String test= "INSERT INTO usuarios VALUES(1,'"+datos.getUsuario()+"','"+datos.getEmail()+"','"+datos.getPass()+"','"+datos.getNombre()+"','"+datos.getApellidos()+"','Usuario')";
//			System.out.println(test);		
//			conection.ejecutarInsert(test);
//			return true;
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return false;
//	}
//	
//	
//	
//	public static UsuarioBean comprobarCorreo(String correo) throws ClassNotFoundException{
//		UsuarioBean usuario= new UsuarioBean();
//		ConexionMYSQL conection = new ConexionMYSQL();
//		try {
//			conection.abrirConexion();
//			
//			String test= "Select * from  usuarios where email='"+correo+"' limit 1";
//			System.out.println(test);		
//			ResultSet a=conection.ejecutarQuery(test);
//			while(a.next()){
//				usuario.setNombre(a.getString("nombre"));
//				usuario.setApellidos(a.getString("apellidos"));
//				usuario.setPass(a.getString("pass"));
//				usuario.setUsuario(a.getString("usuario"));
//				usuario.setEmail(a.getString("email"));
//				usuario.setTipo(a.getString("tipo"));
//			}
//			return usuario;
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return null;
//	}
//	public static int getNumeroUsuarios() throws ClassNotFoundException {
//		ConexionMYSQL conection = new ConexionMYSQL();
//		try {
//			conection.abrirConexion();
//			
//			String test= "select sum(id) from usuarios";
//			System.out.println(test);
//			int numero=0;
//			ResultSet a=conection.ejecutarQuery(test);
//			while(a.next()){
//				numero=a.getInt(1);
//			}
//			return numero;
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return 0;
//	}
//	public static ArrayList getDatosUsuarios() throws ClassNotFoundException {
//		//int numero= UtilBases.getNumeroUsuarios();
//		ArrayList<UsuarioBean> listaUsuarios= new ArrayList();
//		ConexionMYSQL conection = new ConexionMYSQL();
//		try {
//			conection.abrirConexion();
//			String test= "select * from usuarios";
//			System.out.println(test);
//			ResultSet a=conection.ejecutarQuery(test);
//			while(a.next()){
//				UsuarioBean usuarios= new UsuarioBean();
//				usuarios.setUsuario(a.getString("usuario"));
//				usuarios.setEmail(a.getString("email"));
//				usuarios.setPass(a.getString("pass"));
//				usuarios.setNombre(a.getString("nombre"));
//				usuarios.setApellidos(a.getString("apellidos"));
//				usuarios.setTipo(a.getString("tipo"));
//				listaUsuarios.add(usuarios);
//				System.out.println(usuarios.getNombre()+" Agregado");
//			}
//			
//			return listaUsuarios;
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return null;
//	}
//	public static boolean EliminarUsuario(String email) {
//		// TODO Auto-generated method stub
//		ConexionMYSQL conection = new ConexionMYSQL();
//		try {
//			conection.abrirConexion();
//			String test= "delete from usuarios where email='"+email+"'";
//			System.out.println(test);
//			conection.ejecutarDelete(test);
//			return true; 
//	}catch(Exception e){}
//		return false;
//	
// }
//	public static boolean actualizarUsuario(UsuarioBean datos, String emailoriginal) {
//		ConexionMYSQL conection = new ConexionMYSQL();
//		try {
//			conection.abrirConexion();
//			String test= "update usuarios set usuario='"+datos.getUsuario()+" ', email='"+datos.getEmail()+"', pass='"+datos.getPass()+"',nombre='"+datos.getNombre()+"',apellidos='"+datos.getApellidos()+"',tipo='"+datos.getTipo()+"'  where email='"+emailoriginal+"'";
//			System.out.println(test);
//			conection.ejecutarDelete(test);
//			return true; 
//	}catch(Exception e){}
//		return false;
//	}
//}