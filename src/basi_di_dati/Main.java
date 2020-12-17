package basi_di_dati;

import java.sql.Connection;
import java.sql.ResultSet;

import basi_di_dati.Helpers.*;
import basi_di_dati.Models.*;

public class Main {

	public static void main(String[] args) {
		try {
			Connection conn = (new Connector("enoteca", "gestore_enoteca", "Password-Molto-Sicura")).getConnection();

			WineManager wineMng = new WineManager(conn);
			WinefamilyManager winefamilyMng = new WinefamilyManager(conn);

			Wine[] wines = wineMng.getWines();

			for(int i = 0; i < wines.length; i++) {
				System.out.println(wines[i].wine);
			}
			
			Winefamily[] winefamilies = winefamilyMng.getWinefamilies();
			
			for(int i = 0; i < winefamilies.length; i++) {
				System.out.println(winefamilies[i].winefamily);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
