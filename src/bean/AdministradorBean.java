package bean;

public class AdministradorBean {
	private int id;
	private String email;
	private String usuario;
	private String password;
	private String nombre;
	private String apellidos;
	private String avatar;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public AdministradorBean(int id, String email, String usuario,
			String password, String nombre, String apellidos, String avatar) {
		super();
		this.id = id;
		this.email = email;
		this.usuario = usuario;
		this.password = password;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.avatar = avatar;
	}
	public AdministradorBean(String email, String usuario, String password,
			String nombre, String apellidos, String avatar) {
		super();
		this.email = email;
		this.usuario = usuario;
		this.password = password;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.avatar = avatar;
	}
	

	public static void main(String[] args){
	}
}


