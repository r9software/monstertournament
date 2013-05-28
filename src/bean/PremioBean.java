package bean;

public class PremioBean {
private int id;
private String descripcion;
private String tipo;
private String referencia;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getDescripcion() {
	return descripcion;
}
public void setDescripcion(String descripcion) {
	this.descripcion = descripcion;
}
public String getTipo() {
	return tipo;
}
public void setTipo(String tipo) {
	this.tipo = tipo;
}
public String getReferencia() {
	return referencia;
}
public void setReferencia(String referencia) {
	this.referencia = referencia;
}
public PremioBean(int id, String descripcion, String tipo, String referencia) {
	this.id = id;
	this.descripcion = descripcion;
	this.tipo = tipo;
	this.referencia = referencia;
}

public static void main(String[] args){
}
}
