package bean;

public class ClanHasTorneoBean {
	private int idTorneo;
	private int idClan;
	private String fecha;
	private int lugar;
	private int posicion;
	
	public int getIdTorneo() {
		return idTorneo;
	}
	public void setIdTorneo(int idTorneo) {
		this.idTorneo = idTorneo;
	}
	public int getIdClan() {
		return idClan;
	}
	public void setIdClan(int idClan) {
		this.idClan = idClan;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public int getLugar() {
		return lugar;
	}
	public void setLugar(int lugar) {
		this.lugar = lugar;
	}
	public int getPosicion() {
		return posicion;
	}
	public void setPosicion(int posicion) {
		this.posicion = posicion;
	}
	public ClanHasTorneoBean(int idTorneo, int idClan, String fecha, int lugar,
			int posicion) {
		this.idTorneo = idTorneo;
		this.idClan = idClan;
		this.fecha = fecha;
		this.lugar = lugar;
		this.posicion = posicion;
	}

	public static void main(String[] args){
	}
}
