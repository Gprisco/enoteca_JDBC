package basi_di_dati;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class WineWinegrape extends Model {
	private Wine wine;
	public Winegrape winegrape;
	public Integer percentage;

	public WineWinegrape(ResultSet rs) {
		try {
			wine = new Wine(rs, false);
			winegrape = new Winegrape(rs);
			percentage = rs.getInt("percentage");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @param wine        The name of the wine
	 * @param vintage     The vintage of the wine
	 * @param winegrapeId The id of the winegrape to attach to the wine
	 * @param percentage  The percentage of the winegrape
	 * @return The number of inserted rows
	 */
	public static Integer create(String wine, Integer vintage, Integer winegrapeId, Integer percentage) {
		Integer insertedRows = null;

		try {
			String sql = "INSERT INTO wine_winegrape " + "(wine, vintage, winegrapeId, percentage) "
					+ "VALUES (?, ?, ?, ?)";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, wine);
			stmt.setInt(2, vintage);
			stmt.setInt(3, winegrapeId);
			stmt.setInt(4, percentage);

			insertedRows = stmt.executeUpdate();
		} catch (SQLException ex) {
			// handle any errors
			Helpers.handleSQLException(ex);
		}

		return insertedRows;
	}

	/**
	 * 
	 * @return An integer describing the number of deleted rows
	 */
	public Integer destroy() {
		Integer deletedRows = null;

		try {
			String sql = "DELETE FROM wine_winegrape WHERE winegrapeId = ? AND wine = ? AND vintage = ?";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, winegrape.getId());
			stmt.setString(2, wine.getWine());
			stmt.setInt(3, wine.getVintage());

			deletedRows = stmt.executeUpdate();
		} catch (SQLException ex) {
			// handle any errors
			Helpers.handleSQLException(ex);
		}

		return deletedRows;
	}

	public String toString() {
		return winegrape.toString() + " (" + percentage.toString() + "%)";
	}
}
