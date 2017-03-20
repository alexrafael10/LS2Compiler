class Simbolo {

	private int cod;
	private String id;
	private int direccion;

	Simbolo() {
		cod = -1;
		id = "";
	}

	Simbolo(int c, String i) {
		cod = c;
		id = i;
	}

	void setCod(int c) {
		cod = c;
	}

	void setId(String i) {
		id = i;
	}

	int getCod() {
		return cod;
	}

	String getId() {
		return id;
	}

	void setDireccion(int d) {
		direccion = d;
	}

	int getDireccion() {
		return direccion;
	}
}