package bean;

public class ClanUsuarioBean {
	private int idUsuario;
	private int idClan;
	private String antiguedad;
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public int getIdClan() {
		return idClan;
	}
	public void setIdClan(int idClan) {
		this.idClan = idClan;
	}
	public String getAntiguedad() {
		return antiguedad;
	}
	public void setAntiguedad(String antiguedad) {
		this.antiguedad = antiguedad;
	}
	public ClanUsuarioBean(int idUsuario, int idClan, String antiguedad) {
		this.idUsuario = idUsuario;
		this.idClan = idClan;
		this.antiguedad = antiguedad;
	}

	public static void main(String[] args){
	}
}
