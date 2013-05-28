package bean;

public class JuegoHasUsuarioBean {
	private int idUsuario;
	private int idJuego;
	private String fechadeinicio;
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public int getIdJuego() {
		return idJuego;
	}
	public void setIdJuego(int idJuego) {
		this.idJuego = idJuego;
	}
	public String getFechadeinicio() {
		return fechadeinicio;
	}
	public void setFechadeinicio(String fechadeinicio) {
		this.fechadeinicio = fechadeinicio;
	}
	public JuegoHasUsuarioBean(int idUsuario, int idJuego, String fechadeinicio) {
		this.idUsuario = idUsuario;
		this.idJuego = idJuego;
		this.fechadeinicio = fechadeinicio;
	}

	public static void main(String[] args){
	}
}
