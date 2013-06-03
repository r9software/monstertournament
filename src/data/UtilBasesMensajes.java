package data;

import java.sql.SQLException;

public class UtilBasesMensajes {

	private static String regex="-.....-";
	public static boolean enviarMensaje(int idamigo, int idusuario,
			String mensaje, String web, String email, String asunto) throws ClassNotFoundException {
		// TODO Auto-generated method stub
		//INSERT INTO `torneosplay`.`mensaje_amigo`
//		(`id`,`idusuario`,`idamigo`,`asunto`,`email`,`sitio`,`mensaje`)
//				VALUES
//				(
//				<{id: }>,
//				<{idusuario: }>,
//				<{idamigo: }>,
//				<{asunto: }>,
//				<{email: }>,
//				<{sitio: }>,
//				<{mensaje: }>
//				);
		ConexionMYSQL conection = new ConexionMYSQL();
		try {
			conection.abrirConexion();
			
			String test= "INSERT INTO `torneosplay`.`mensaje_amigo`	(`idusuario`,`idamigo`,`asunto`,`email`,`sitio`,`mensaje`)  VALUES('"+idusuario+"','"+idamigo+"','"+asunto+"','"+email+"','"+web+"','"+mensaje+"')";
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
