package basi_di_dati;

import java.sql.SQLException;

public class Helpers {
		
	public static void handleSQLException(SQLException ex) {
		System.out.println("SQLException: " + ex.getMessage());
		System.out.println("SQLState: " + ex.getSQLState());
		System.out.println("VendorError: " + ex.getErrorCode());
	}

	public enum Winecolor {
		Rosso(1),
		Bianco(2),
		Rosato(3);
		
	    private final Integer winecolorValue;
	    private Winecolor(Integer value) {
	        this.winecolorValue = value;
	    }

	    public int getValue() {
	        return winecolorValue;
	    }
	}
	
	public enum Winetype {
		Passito(1),
		Fermo(2),
		SpumanteClassico(3),
		SpumanteCharmat(4),
		Frizzante(5),
		Liquoroso(6);
		
	    private final Integer winetypeValue;
	    private Winetype(Integer value) {
	        this.winetypeValue = value;
	    }

	    public int getValue() {
	        return winetypeValue;
	    }
	}

	public enum Winedenom {
		DOCG(1),
		DOC(2),
		IGT(3),
		NONE(4);
		
	    private final Integer winedenomValue;
	    private Winedenom(Integer value) {
	        this.winedenomValue = value;
	    }

	    public int getValue() {
	        return winedenomValue;
	    }
	}

}
