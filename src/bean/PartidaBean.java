package bean;

public class PartidaBean {
	private int id;
	private int tipo;
	private String fecha;
	private int ronda;
	private int ganador;
	private int participantes;
	private int idtorneo;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public int getRonda() {
		return ronda;
	}
	public void setRonda(int ronda) {
		this.ronda = ronda;
	}
	public int getGanador() {
		return ganador;
	}
	public void setGanador(int ganador) {
		this.ganador = ganador;
	}
	public int getParticipantes() {
		return participantes;
	}
	public void setParticipantes(int participantes) {
		this.participantes = participantes;
	}
	public int getIdtorneo() {
		return idtorneo;
	}
	public void setIdtorneo(int idtorneo) {
		this.idtorneo = idtorneo;
	}
	public PartidaBean(int id, int tipo, String fecha, int ronda, int ganador,
			int participantes, int idtorneo) {
		this.id = id;
		this.tipo = tipo;
		this.fecha = fecha;
		this.ronda = ronda;
		this.ganador = ganador;
		this.participantes = participantes;
		this.idtorneo = idtorneo;
	}

	public static void main(String[] args){
	}
}
