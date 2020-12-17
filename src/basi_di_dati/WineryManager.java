package basi_di_dati;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import basi_di_dati.Models.*;

public class WineryManager {
	Connection conn;

	public WineryManager(Connection conn) {
		this.conn = conn;
	}

	/**
	 * 
	 * @return All the wineries in the database
	 */
	public Winery[] getWineries() {
		List<Winery> wineries = new ArrayList<Winery>();

		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM winery");

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
	public Winery getWinery(Integer wineryId) {
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
	public Integer createWinery(String winery, String address, String telephone) {
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
	public Integer deleteWinery(Integer wineryId) {
		Integer insertedRows = null;

		try {
			String sql = "DELETE FROM winery WHERE wineryId = ?";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, wineryId);

			insertedRows = stmt.executeUpdate();
		} catch (SQLException ex) {
			// handle any errors
			Helpers.handleSQLException(ex);
		}

		return insertedRows;

	}
}
