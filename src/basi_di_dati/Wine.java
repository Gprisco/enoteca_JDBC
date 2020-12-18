package basi_di_dati;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.List;

public class Wine extends Model {
	public String wine;
	public Integer vintage;
	public Integer availability;
	public Integer price;
	public Integer wineryId;
	public Integer winefamilyId;
	public Winefamily winefamily = null;
	public Winery winery = null;

	public Wine(ResultSet rs, Boolean fetchRelations) {
		try {
			this.wine = rs.getString("wine");
			this.vintage = rs.getInt("vintage");
			this.availability = rs.getInt("availability");
			this.price = rs.getInt("price");
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

	public String toStringTest() {
		return "Vino: " + this.wine + "\n" + "Annata: " + this.vintage.toString() + "\n" + "Prezzo: "
				+ this.price.toString() + "\n" + "Bottiglie: " + this.availability.toString() + "\n" + "wineryId: "
				+ this.wineryId.toString() + "\n" + "winefamilyId: " + this.winefamilyId.toString();
	}

	/**
	 * 
	 * @return A ResultSet containing all the rows from the wine table
	 */
	public static Wine[] getWines() {
		List<Wine> wines = new ArrayList<Wine>();

		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM wine");

			while (rs.next()) {
				wines.add(new Wine(rs, false));
			}
		} catch (SQLException ex) {
			// handle any errors
			Helpers.handleSQLException(ex);
		}

		return wines.toArray(new Wine[wines.size()]);
	}

	/**
	 * 
	 * @param name    The name of the wine to fetch
	 * @param vintage The vintage of the wine to fetch
	 * @return The Wine fetched from db or null
	 */
	public static Wine getWine(String name, Integer vintage) {
		Wine wine = null;

		try {
			String sql = "SELECT * FROM wine " + "INNER JOIN winery ON winery.wineryId = wine.wineryId "
					+ "INNER JOIN winefamily ON winefamily.winefamilyId = wine.winefamilyId "
					+ "INNER JOIN winecolor ON winecolor.winecolorId = winefamily.winecolorId "
					+ "INNER JOIN winetype ON winetype.winetypeId = winefamily.winetypeId "
					+ "INNER JOIN winedenom ON winedenom.winedenomId = winefamily.winedenomId "
					+ "INNER JOIN region ON region.regionId = winefamily.regionId "
					+ "INNER JOIN country ON region.countryId = country.countryId " + "WHERE wine = ? AND vintage = ?";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, name.toLowerCase());
			stmt.setInt(2, vintage);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				wine = new Wine(rs, true);
			}
		} catch (SQLException ex) {
			// handle any errors
			Helpers.handleSQLException(ex);
		}

		return wine;
	}

	/**
	 * 
	 * @param name         A lower case string representing the name of the wine
	 * @param vintage      An Integer describing in which year the wine has been
	 *                     produced
	 * @param availability An Integer representing how many bottles the wine seller
	 *                     has
	 * @param price        A number describing the price of the bottle
	 * @param wineryId     The ID of the related winery
	 * @param winefamilyId The ID of the related winefamily
	 * @return An Integer describing the number of rows which have been created
	 */
	public static Integer createWine(String name, Integer vintage, Integer availability, Integer price,
			Integer wineryId, Integer winefamilyId) {
		Integer insertedRows = null;

		try {
			String sql = "INSERT INTO wine " + "(wine, vintage, availability, price, wineryId, winefamilyId) "
					+ "VALUES (?, ?, ?, ?, ?, ?)";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setInt(2, vintage);
			stmt.setInt(3, availability);
			stmt.setInt(4, price);
			stmt.setInt(5, wineryId);
			stmt.setInt(6, winefamilyId);

			insertedRows = stmt.executeUpdate();
		} catch (SQLException ex) {
			// handle any errors
			Helpers.handleSQLException(ex);
		}

		return insertedRows;
	}

	/**
	 * 
	 * @param wine         The name of the wine to update
	 * @param vintage      The vintage of the wine to update
	 * @param availability The new availability of the wine (this parameter will be
	 *                     saved in the database)
	 * @return The number of rows which have been updated
	 */
	public Integer updateWineAvailability(Integer availability) {
		Integer insertedRows = null;

		try {
			String sql = "UPDATE wine SET availability = ? WHERE wine = ? AND vintage = ?";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, availability);
			stmt.setString(2, wine);
			stmt.setInt(3, vintage);

			insertedRows = stmt.executeUpdate();
		} catch (SQLException ex) {
			// handle any errors
			Helpers.handleSQLException(ex);
		}

		return insertedRows;
	}

	/**
	 * 
	 * @param wine    The name of the wine to update
	 * @param vintage The vintage of the wine to update
	 * @param price   The new price of the wine (this parameter will be saved in the
	 *                database)
	 * @return The number of rows which have been updated
	 */
	public Integer updateWinePrice(Float price) {
		Integer insertedRows = null;

		try {
			String sql = "UPDATE wine SET price = ? WHERE wine = ? AND vintage = ?";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setFloat(1, price);
			stmt.setString(2, wine);
			stmt.setInt(3, vintage);

			insertedRows = stmt.executeUpdate();
		} catch (SQLException ex) {
			// handle any errors
			Helpers.handleSQLException(ex);
		}

		return insertedRows;
	}

	/**
	 * 
	 * @param wine    The string describing the name of the wine
	 * @param vintage The vintage of the wine
	 * @return The number of rows which have been deleted
	 */
	public Integer destroy() {
		Integer insertedRows = null;

		try {
			String sql = "DELETE FROM wine WHERE wine = ? AND vintage = ?";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, wine);
			stmt.setInt(2, vintage);

			insertedRows = stmt.executeUpdate();
		} catch (SQLException ex) {
			// handle any errors
			Helpers.handleSQLException(ex);
		}

		return insertedRows;
	}
}
