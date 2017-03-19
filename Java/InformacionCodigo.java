// Esta clase se utiliza para guardar y recuperar informaci�n de punto del c�digo
// fuente por el que se va analizando
class InformacionCodigo {

	public static int linea;
	public static int caracter;
	public static String token;

	public static void guardarInformacionCodigo(int l,int c,String t) {
		linea = l;
		caracter = c;
		token = t;
	}
}
