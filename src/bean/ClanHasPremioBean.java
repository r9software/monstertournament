package bean;

public class ClanHasPremioBean {
	private int idClan;
	private int idPremio;
	private String fechaentrego;
	
	public int getIdClan() {
		return idClan;
	}
	public void setIdClan
	(int idClan) {
		this.idClan = idClan;
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
	public ClanHasPremioBean(int idClan, int idPremio, String fechaentrego) {
		this.idClan = idClan;
		this.idPremio = idPremio;
		this.fechaentrego = fechaentrego;
	} 

	public static void main(String[] args){
	}
}
