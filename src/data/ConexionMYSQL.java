package data;

	import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

	/**
	 *
	 * @author Rodolfo
	 */
	public class ConexionMYSQL {
	    // Objetos de clase.
	    private Connection conexion;
	    private Statement statement;
	    
	    /**
	     * Constructor 
	     * @param user
	     * @param pwd
	     * @param DB
	     * @throws SQLException 
	     */
	   
	    
	    /**
	     * Metodo publico que abre una conexion a la base de datos mysql (localhost).
	     * @throws SQLException 
	     * @throws ClassNotFoundException 
	     */
	    public void abrirConexion()throws SQLException, ClassNotFoundException{
	     Class.forName("com.mysql.jdbc.Driver");
	    	this.conexion = DriverManager.getConnection ("jdbc:mysql://localhost:3306/torneosplay", "root", "root");
	        this.statement = this.conexion.createStatement();
	    }
	    public static void main(String[] args) throws ClassNotFoundException{
	    	ConexionMYSQL a= new ConexionMYSQL();
	    	try {
				a.abrirConexion();
				
				System.out.println("Funciona");
		    	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	    
	    /**
	     * 
	     * @param query
	     * @return
	     * @throws SQLException 
	     */
	    public ResultSet ejecutarQuery(String query) throws SQLException{
	    	return statement.executeQuery(query);
	    }
	    /**
	     * 
	     * @param query
	     * @return
	     * @throws SQLException 
	     */
	    public boolean ejecutarInsert(String query) throws SQLException{
	    	return statement.execute(query);
	    }
	    /**
	     * 
	     * @param query
	     * @return
	     * @throws SQLException 
	     */
	    public int ejecutarUpdate(String query) throws SQLException{
	    	return statement.executeUpdate(query);
	    }
	    
	    /**
	     * 
	     * @throws SQLException 
	     */
	    public void terminarConexion() throws SQLException{
	        this.conexion.close();
	    }
	    
	  
	}

