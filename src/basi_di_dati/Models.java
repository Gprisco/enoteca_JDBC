package basi_di_dati;

import java.sql.ResultSet;
import java.sql.SQLException;

import basi_di_dati.Helpers.*;

public class Models {

	public static class Wine {
		public String wine;
		public Integer vintage;
		public Integer availability;
		public Float price;
		public Integer wineryId;
		public Integer winefamilyId;
		public Winefamily winefamily = null;

		public Wine(ResultSet rs, Boolean fetchWinefamily) {
			try {
				this.wine = rs.getString("wine");
				this.vintage = rs.getInt("vintage");
				this.availability = rs.getInt("availability");
				this.price = rs.getFloat("price");
				this.wineryId = rs.getInt("wineryId");
				this.winefamilyId = rs.getInt("winefamilyId");

				if (fetchWinefamily) {
					this.winefamily = new Winefamily(rs);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static class Winefamily {
		public Integer winefamilyId;
		public String winefamily;
		public Winecolor winecolor;
		public Winetype winetype;
		public Winedenom winedenom;
		public Integer regionId;

		public Winefamily(ResultSet rs) {
			try {
				this.winefamilyId = rs.getInt("winefamilyId");
				this.winefamily = rs.getString("winefamily");
				winecolor = Winecolor.values()[rs.getInt("winecolorId") - 1];
				winetype = Winetype.values()[rs.getInt("winetype") - 1];
				winedenom = Winedenom.values()[rs.getInt("winedenomId") - 1];
				this.regionId = rs.getInt("regionId");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
