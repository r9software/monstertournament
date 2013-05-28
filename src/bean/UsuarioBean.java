package bean;

public class UsuarioBean {
	private int id;
	private String usuario;
	private String email;
	private String password;
	private String nombre;
	private String apellidos;
	private String avatar;
	private int clan;
	private int ganadas;
	private int perdidas;
	private int empatadas;
	
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public int getClan() {
		return clan;
	}
	public void setClan(int clan) {
		this.clan = clan;
	}
	public int getGanadas() {
		return ganadas;
	}
	public void setGanadas(int ganadas) {
		this.ganadas = ganadas;
	}
	public int getPerdidas() {
		return perdidas;
	}
	public void setPerdidas(int perdidas) {
		this.perdidas = perdidas;
	}
	public int getEmpatadas() {
		return empatadas;
	}
	public void setEmpatadas(int empatadas) {
		this.empatadas = empatadas;
	}
	public UsuarioBean(int id, String usuario, String email, String password,
			String nombre, String apellidos, String avatar, int clan,
			int ganadas, int perdidas, int empatadas) {
		this.id = id;
		this.usuario = usuario;
		this.email = email;
		this.password = password;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.avatar = avatar;
		this.clan = clan;
		this.ganadas = ganadas;
		this.perdidas = perdidas;
		this.empatadas = empatadas;
	}
	public UsuarioBean() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args){
	}
	

	
}
