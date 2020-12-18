package basi_di_dati;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Winery extends Model {
	private Integer wineryId;
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
			e.printStackTrace();
		}

	}
	
	public Integer getId() {
		return wineryId;
	}

	/**
	 * 
	 * @return All the wineries in the database
	 */
	public static Winery[] getWineries() {
		List<Winery> wineries = new ArrayList<Winery>();

		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM winery ORDER BY wineryId DESC LIMIT 3");

			while (rs.next()) {
				wineries.add(new Winery(rs));
			}
		} catch (SQLException ex) {
			// handle any errors
			Helpers.handleSQLException(ex);
		}

		return wineries.toArray(new Winery[wineries.size()]);
	}

	/**
	 * 
	 * @param wineryId The id of the winery to fetch
	 * @return The winery fetched from the database or null
	 */
	public static Winery getWinery(Integer wineryId) {
		Winery winery = null;

		try {
			String sql = "SELECT * FROM winery WHERE wineryId = ?";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, wineryId);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				winery = new Winery(rs);
			}
		} catch (SQLException ex) {
			// handle any errors
			Helpers.handleSQLException(ex);
		}

		return winery;
	}

	/**
	 * 
	 * @param winery    The name of the winery to create
	 * @param address   The address of the winery to create
	 * @param telephone The telephone number as a string of the winery to create
	 * @return The number of rows which have been created
	 */
	public static Integer create(String winery, String address, String telephone) {
		Integer insertedRows = null;

		try {
			String sql = "INSERT INTO winery " + "(winery, address, telephone) " + "VALUES (?, ?, ?)";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, winery);
			stmt.setString(2, address);
			stmt.setString(3, telephone);

			insertedRows = stmt.executeUpdate();
		} catch (SQLException ex) {
			// handle any errors
			Helpers.handleSQLException(ex);
		}

		return insertedRows;
	}

	/**
	 * 
	 * @param wineryId The id of the winery to delete
	 * @return The number of rows which have been deleted
	 */
	public Integer destroy() {
		Integer deletedRows = null;

		try {
			String sql = "DELETE FROM winery WHERE wineryId = ?";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, wineryId);

			deletedRows = stmt.executeUpdate();
		} catch (SQLException ex) {
			// handle any errors
			Helpers.handleSQLException(ex);
		}

		return deletedRows;
	}

	public String toString() {
		return "\n\nwineryId:\t\t" + wineryId.toString() + "\nWinery:\t\t\t" + winery + "\nIndirizzo:\t\t" + address
				+ "\nTelefono:\t\t" + telephone;
	}
}
