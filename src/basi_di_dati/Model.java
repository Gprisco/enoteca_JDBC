package basi_di_dati;

import java.sql.Connection;

public class Model {
	
	public static Connection conn = (new Connector("enoteca", "gestore_enoteca", "Password-Molto-Sicura")).getConnection();	
}
