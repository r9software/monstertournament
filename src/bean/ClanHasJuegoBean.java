package bean;

public class ClanHasJuegoBean {
	private int idClan;
	private int idJuego;
	public int getIdClan() {
		return idClan;
	}
	public void setIdClan(int id) {
		this.idClan = id;
	}
	public int getIdJuego() {
		return idJuego;
	}
	public void setIdJuego(int idJuego) {
		this.idJuego = idJuego;
	}
	public ClanHasJuegoBean(int idClan, int idJuego) {
		this.idClan = idClan;
		this.idJuego = idJuego;
	}

	public static void main(String[] args){
	}
}
