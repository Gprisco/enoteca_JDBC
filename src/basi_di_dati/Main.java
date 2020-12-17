package basi_di_dati;

import java.sql.Connection;

import basi_di_dati.Models.*;

public class Main {

	public static void main(String[] args) {
		try {
			Connection conn = (new Connector("enoteca", "gestore_enoteca", "Password-Molto-Sicura")).getConnection();

			WineManager wineMng = new WineManager(conn);
			WinefamilyManager winefamilyMng = new WinefamilyManager(conn);
			WineryManager wineryMng = new WineryManager(conn);

			System.out.println("---- TEST SUITE -----");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
