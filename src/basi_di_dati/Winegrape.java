package basi_di_dati;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Winegrape extends Model {
	private Integer winegrapeId;
	public String winegrape;

	public Winegrape(ResultSet rs) {
		try {
			winegrapeId = rs.getInt("winegrapeId");
			winegrape = rs.getString("winegrape");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Integer getId() {
		return winegrapeId;
	}

	/**
	 * 
	 * @return An array of all the winegrapes in the database
	 */
	public static Winegrape[] getWinegrapes() {
		List<Winegrape> winegrapes = new ArrayList<Winegrape>();

		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM winegrape ORDER BY winegrapeId DESC LIMIT 3");

			while (rs.next()) {
				winegrapes.add(new Winegrape(rs));
			}
		} catch (SQLException ex) {
			// handle any errors
			Helpers.handleSQLException(ex);
		}

		return winegrapes.toArray(new Winegrape[winegrapes.size()]);
	}

	/**
	 * 
	 * @param winegrape A string describing the name of the winegrape
	 * @return The number of inserted rows
	 */
	public static Integer create(String winegrape) {
		Integer insertedRows = null;

		try {
			String sql = "INSERT INTO winegrape " + "(winegrape) " + "VALUES (?)";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, winegrape);

			insertedRows = stmt.executeUpdate();
		} catch (SQLException ex) {
			// handle any errors
			Helpers.handleSQLException(ex);
		}

		return insertedRows;
	}

	/**
	 * 
	 * @return The number of deleted rows
	 */
	public Integer destroy() {
		Integer deletedRows = null;

		try {
			String sql = "DELETE FROM winegrape WHERE winegrapeId = ?";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, winegrapeId);

			deletedRows = stmt.executeUpdate();
		} catch (SQLException ex) {
			// handle any errors
			Helpers.handleSQLException(ex);
		}

		return deletedRows;
	}

	public String toString() {
		return "#" + winegrapeId.toString() + " - " + winegrape;
	}
}
