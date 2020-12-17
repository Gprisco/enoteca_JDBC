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
		public Winery winery = null;

		public Wine(ResultSet rs, Boolean fetchRelations) {
			try {
				this.wine = rs.getString("wine");
				this.vintage = rs.getInt("vintage");
				this.availability = rs.getInt("availability");
				this.price = rs.getFloat("price");
				this.wineryId = rs.getInt("wineryId");
				this.winefamilyId = rs.getInt("winefamilyId");

				if (fetchRelations) {
					this.winefamily = new Winefamily(rs);
					this.winery = new Winery(rs);
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

	public static class Winery {
		public Integer wineryId;
		public String winery;
		public String address;
		public String telephone;

		public Winery(ResultSet rs) {
			try {
				this.wineryId = rs.getInt("wineryId");
				this.winery = rs.getString("winery");
				this.address = rs.getString("address");
				this.telephone = rs.getString("telephone");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}
}
