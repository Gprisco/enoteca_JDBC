package basi_di_dati;

import basi_di_dati.Models.*;
import basi_di_dati.Helpers.*;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.List;

public class WinefamilyManager {
	Connection conn;

	public WinefamilyManager(Connection conn) {
		this.conn = conn;
	}

	/**
	 * 
	 * @return ResultSet containing all the rows from winefamily table
	 */
	public Winefamily[] getWinefamilies() {
		Statement stmt = null;
		ResultSet rs = null;

		List<Winefamily> winefamilies = new ArrayList<Winefamily>();

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM winefamily");

			while (rs.next()) {
				winefamilies.add(new Winefamily(rs));
			}
		} catch (SQLException ex) {
			// handle any errors
			Helpers.handleSQLException(ex);
		}

		return winefamilies.toArray(new Winefamily[winefamilies.size()]);
	}

	/**
	 * 
	 * @param winefamilyId The ID of the winefamily to fetch
	 * @return A ResultSet containing one single Winefamily
	 */
	public Winefamily getWinefamily(Integer winefamilyId) {
		Winefamily winefamily = null;

		try {
			String sql = "SELECT * FROM winefamily WHERE winefamilyId = ?";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, winefamilyId);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				winefamily = new Winefamily(rs);
			}
		} catch (SQLException ex) {
			// handle any errors
			Helpers.handleSQLException(ex);
		}

		return winefamily;
	}

	/**
	 * 
	 * @param name        The name of the winefmaily
	 * @param winecolorId The ID of the color of the winefamily's wines
	 * @param winetypeId  The ID of the type of the winefamily's wines
	 * @param winedenomId The ID of the denom of the winefamily's wines
	 * @param regionId    The ID of the region of the winefamily's wines
	 * @return An Integer describing the number of rows which have been created
	 */
	public Integer createWinefamily(String name, Winecolor winecolorId, Winetype winetypeId, Winedenom winedenomId,
			Integer regionId) {
		Integer insertedRows = null;

		try {
			String sql = "INSERT INTO winefamily " + "(winefamily, winecolorId, winetypeId, winedenomId, regionId) "
					+ "VALUES (?, ?, ?, ?, ?)";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setInt(2, winecolorId.getValue());
			stmt.setInt(3, winetypeId.getValue());
			stmt.setInt(4, winedenomId.getValue());
			stmt.setInt(5, regionId);

			insertedRows = stmt.executeUpdate();
		} catch (SQLException ex) {
			// handle any errors
			Helpers.handleSQLException(ex);
		}

		return insertedRows;
	}

	/**
	 * 
	 * @param winefamilyId The id of the winefamily to delete
	 * @return The number of rows which have been deleted
	 */
	public Integer deleteWinefamily(Integer winefamilyId) {
		Integer insertedRows = null;

		try {
			String sql = "DELETE FROM winefamily WHERE winefamilyId = ?";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, winefamilyId);

			insertedRows = stmt.executeUpdate();
		} catch (SQLException ex) {
			// handle any errors
			Helpers.handleSQLException(ex);
		}

		return insertedRows;
	}
}
