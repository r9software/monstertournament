package bean;

public class TorneoClanBean {
	private int id;
	private String nombre;
	private String descripcion;
	private int juego;
	private int premio;
	private int administrador;
	private int clancreador;
	private String fechadeinicio;
	private String fechadetermino;
	private int gratuito;
	private int participantes;
	private int tipo;
	private int ganador;
	private int numeropartidas;
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
	public int getJuego() {
		return juego;
	}
	public void setJuego(int juego) {
		this.juego = juego;
	}
	public int getPremio() {
		return premio;
	}
	public void setPremio(int premio) {
		this.premio = premio;
	}
	public int getAdministrador() {
		return administrador;
	}
	public void setAdministrador(int administrador) {
		this.administrador = administrador;
	}
	public int getClancreador() {
		return clancreador;
	}
	public void setClancreador(int clancreador) {
		this.clancreador = clancreador;
	}
	public String getFechadeinicio() {
		return fechadeinicio;
	}
	public void setFechadeinicio(String fechadeinicio) {
		this.fechadeinicio = fechadeinicio;
	}
	public String getFechadetermino() {
		return fechadetermino;
	}
	public void setFechadetermino(String fechadetermino) {
		this.fechadetermino = fechadetermino;
	}
	public int getGratuito() {
		return gratuito;
	}
	public void setGratuito(int gratuito) {
		this.gratuito = gratuito;
	}
	public int getParticipantes() {
		return participantes;
	}
	public void setParticipantes(int participantes) {
		this.participantes = participantes;
	}
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public int getGanador() {
		return ganador;
	}
	public void setGanador(int ganador) {
		this.ganador = ganador;
	}
	public int getNumeropartidas() {
		return numeropartidas;
	}
	public void setNumeropartidas(int numeropartidas) {
		this.numeropartidas = numeropartidas;
	}
	public TorneoClanBean(int id, String nombre, String descripcion, int juego,
			int premio, int administrador, int clancreador,
			String fechadeinicio, String fechadetermino, int gratuito,
			int participantes, int tipo, int ganador, int numeropartidas) {
		this.id = id;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.juego = juego;
		this.premio = premio;
		this.administrador = administrador;
		this.clancreador = clancreador;
		this.fechadeinicio = fechadeinicio;
		this.fechadetermino = fechadetermino;
		this.gratuito = gratuito;
		this.participantes = participantes;
		this.tipo = tipo;
		this.ganador = ganador;
		this.numeropartidas = numeropartidas;
	}

	public static void main(String[] args){
	}
	
}
