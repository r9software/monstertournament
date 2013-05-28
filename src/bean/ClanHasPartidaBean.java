package bean;

public class ClanHasPartidaBean {
private int idPartida;
private int idClan;
private int posicion;
public int getIdPartida() {
	return idPartida;
}
public void setIdPartida(int idPartida) {
	this.idPartida = idPartida;
}
public int getIdClan() {
	return idClan;
}
public void setIdClan(int idClan) {
	this.idClan = idClan;
}
public int getPosicion() {
	return posicion;
}
public void setPosicion(int posicion) {
	this.posicion = posicion;
}
public ClanHasPartidaBean(int idPartida, int idUsuario, int posicion) {
	this.idPartida = idPartida;
	this.idClan = idUsuario;
	this.posicion = posicion;
}

public static void main(String[] args){
}
}
