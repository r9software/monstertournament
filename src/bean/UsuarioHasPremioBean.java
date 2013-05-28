package bean;

public class UsuarioHasPremioBean {
	private int idUsuario;
	private int idPremio;
	private String fechaentrego;
	
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public int getIdPremio() {
		return idPremio;
	}
	public void setIdPremio(int idPremio) {
		this.idPremio = idPremio;
	}
	public String getFechaentrego() {
		return fechaentrego;
	}
	public void setFechaentrego(String fechaentrego) {
		this.fechaentrego = fechaentrego;
	}
	public UsuarioHasPremioBean(int idUsuario, int idPremio, String fechaentrego) {
		this.idUsuario = idUsuario;
		this.idPremio = idPremio;
		this.fechaentrego = fechaentrego;
	} 

	public static void main(String[] args){
	}
}
