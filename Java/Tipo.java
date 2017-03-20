class Tipo {

	private int cod;
	private String id;

	Tipo() {
		cod = -1;
		id = "";
	}

	Tipo(int c, String i) {
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
}