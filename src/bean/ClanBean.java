package bean;

public class ClanBean {
	private int id;
	private String nombre;
	private String descripcion;
	private int idCreador;
	private String avatar;
	private int ganadas;
	private int perdidas;
	private int empatadas;
	private String etiqueta;
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
	public int getIdCreador() {
		return idCreador;
	}
	public void setIdCreador(int idCreador) {
		this.idCreador = idCreador;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
	public ClanBean(int id, String nombre, String descripcion, int idCreador,
			String avatar, int ganadas, int perdidas, int empatadas,
			String etiqueta) {
		this.id = id;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.idCreador = idCreador;
		this.avatar = avatar;
		this.ganadas = ganadas;
		this.perdidas = perdidas;
		this.empatadas = empatadas;
		this.etiqueta = etiqueta;
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
	public String getEtiqueta() {
		return etiqueta;
	}
	public void setEtiqueta(String etiqueta) {
		this.etiqueta = etiqueta;
	}

	public static void main(String[] args){
	}
	
}
