package bean;

public class UsuarioHasPartida {
private int idPartida;
private int idUsuario;
private int posicion;
public int getIdPartida() {
	return idPartida;
}
public void setIdPartida(int idPartida) {
	this.idPartida = idPartida;
}
public int getIdUsuario() {
	return idUsuario;
}
public void setIdUsuario(int idUsuario) {
	this.idUsuario = idUsuario;
}
public int getPosicion() {
	return posicion;
}
public void setPosicion(int posicion) {
	this.posicion = posicion;
}
public UsuarioHasPartida(int idPartida, int idUsuario, int posicion) {
	this.idPartida = idPartida;
	this.idUsuario = idUsuario;
	this.posicion = posicion;
}

public static void main(String[] args){
}
}
