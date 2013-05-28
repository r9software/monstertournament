package bean;

public class UsuarioHasTorneoBean {
	private int idTorneo;
	private int idUsuario;
	private String fecha;
	private int posicion;
	
	public int getIdTorneo() {
		return idTorneo;
	}
	public void setIdTorneo(int idTorneo) {
		this.idTorneo = idTorneo;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public int getPosicion() {
		return posicion;
	}
	public void setPosicion(int posicion) {
		this.posicion = posicion;
	}
	public UsuarioHasTorneoBean(int idTorneo, int idUsuario, String fecha, 
			int posicion) {
		this.idTorneo = idTorneo;
		this.idUsuario = idUsuario;
		this.fecha = fecha;
		this.posicion = posicion;
	}

	public static void main(String[] args){
	}
}
