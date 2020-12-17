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
			System.out.println(
					"\n[*] Creo un nuovo vino con nome 'sassicaia' e annata 2017 con 10 bottiglie disponibili a un prezzo di 30€ l'una, prodotto dalla winery con id 546 e della famiglia con id 9...");

			String wineName = "sassicaia";
			Integer vintage = 2017;
			wineMng.createWine(wineName, vintage, 10, 30, 546, 9);

			System.out.println("\n[*] Cerco il vino appena inserito nel database...\n");
			Wine wine = wineMng.getWine(wineName, vintage);
			System.out.println(wine.toStringTest());

			System.out.println("\n[*] Elimino il vino appena creato...");
			wineMng.deleteWine(wineName, vintage);

			System.out.println("\n[*] Fine test Vino.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
