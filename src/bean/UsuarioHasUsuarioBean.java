package bean;

public class UsuarioHasUsuarioBean {
	private int idUsuario;
	private int idAmigo;
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public int getIdAmigo() {
		return idAmigo;
	}
	public void setIdAmigo(int idAmigo) {
		this.idAmigo = idAmigo;
	}
	public UsuarioHasUsuarioBean(int idUsuario, int idAmigo) {
		this.idUsuario = idUsuario;
		this.idAmigo = idAmigo;
	}
	public static void main(String[] args){
	}
	
}
