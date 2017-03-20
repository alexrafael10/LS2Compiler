import java.util.Vector;

class Tabla {

	private Vector tablaSimbolos;
	private Vector tablaTipos;

	Tabla() {
		tablaSimbolos = new Vector();
		tablaTipos = new Vector();
		addTipo("int");
		addTipo("real");
	}

	void addSimbolo(String id) {
		tablaSimbolos.add(new Simbolo(countSimbolos(),id));
	}

	void addTipo(String id) {
		tablaTipos.add(new Tipo(countTipos(),id));
	}

	int countSimbolos() {
		return tablaSimbolos.size();
	}

	int countTipos() {
		return tablaTipos.size();
	}

	Simbolo getSimbolo(int pos) {
		return (Simbolo)tablaSimbolos.elementAt(pos);
	}

	Tipo getTipo(int pos) {
		return (Tipo)tablaTipos.elementAt(pos);
	}

	Simbolo getSimbolo(String id) {
		Simbolo simbolo = null;
		for(int i=0;i<countSimbolos();i++) {
			simbolo = getSimbolo(i);
			if(simbolo.getId().equals(id)) {
				break;
			} else {
				simbolo = null;
			}
		}
		return simbolo;
	}

	Tipo getTipo(String id) {
		Tipo tipo = null;
		for(int i=0;i<countTipos();i++) {
			tipo = getTipo(i);
			if(tipo.getId().equals(id)) {
				break;
			} else {
				tipo = null;
			}
		}
		return tipo;
	}

	boolean existeSimbolo(String id) {
		if(getSimbolo(id)!=null) {
			return true;
		} else {
			return false;
		}
	}

	boolean existeTipo(String id) {
		if(getTipo(id)!=null) {
			return true;
		} else {
			return false;
		}
	}

	void setSimbolo(Simbolo s) {
		int cod = s.getCod();
		tablaSimbolos.setElementAt(s,cod);
	}

	void setDireccionSimbolo(String id,int d) {
		Simbolo simbolo = getSimbolo(id);
		simbolo.setDireccion(d);
		setSimbolo(simbolo);
	}
}
