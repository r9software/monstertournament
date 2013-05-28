package bean;

public class JuegoBean {
	private int id;
	private String nombre;
	private String descripcion;
	private String plataforma;
	private String genero;
	private String jugadores;
	private String idioma;
	private String lanzamiento;
	private String imagen1,imagen2,imagen3;
	private int idUsuario;
	private boolean validado;
	private int administrador;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getPlataforma() {
		return plataforma;
	}
	public void setPlataforma(String plataforma) {
		this.plataforma = plataforma;
	}
	public String getGenero() {
		return genero;
	}
	public void setGenero(String genero) {
		this.genero = genero;
	}
	public String getJugadores() {
		return jugadores;
	}
	public void setJugadores(String jugadores) {
		this.jugadores = jugadores;
	}
	public String getIdioma() {
		return idioma;
	}
	public void setIdioma(String idioma) {
		this.idioma = idioma;
	}
	public String getLanzamiento() {
		return lanzamiento;
	}
	public void setLanzamiento(String lanzamiento) {
		this.lanzamiento = lanzamiento;
	}
	public String getImagen1() {
		return imagen1;
	}
	public void setImagen1(String imagen1) {
		this.imagen1 = imagen1;
	}
	public String getImagen2() {
		return imagen2;
	}
	public void setImagen2(String imagen2) {
		this.imagen2 = imagen2;
	}
	public String getImagen3() {
		return imagen3;
	}
	public void setImagen3(String imagen3) {
		this.imagen3 = imagen3;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	
	public boolean getValidado() {
		return validado;
	}
	public void setValidado(boolean validado) {
		this.validado = validado;
	}
	public JuegoBean(int id, String nombre, String descripcion,
			String plataforma, String genero, String jugadores, String idioma,
			String lanzamiento, String imagen1, String imagen2, String imagen3,int administrador,
			int idUsuario, boolean validado) {
		this.id = id;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.plataforma = plataforma;
		this.genero = genero;
		this.jugadores = jugadores;
		this.idioma = idioma;
		this.lanzamiento = lanzamiento;
		this.imagen1 = imagen1;
		this.imagen2 = imagen2;
		this.imagen3 = imagen3;
		this.idUsuario = idUsuario;
		this.validado = validado;
		this.administrador=administrador;
	}
	public int getAdministrador() {
		return administrador;
	}
	public void setAdministrador(int administrador) {
		this.administrador = administrador;
	}

	public static void main(String[] args){
	}
	
}
