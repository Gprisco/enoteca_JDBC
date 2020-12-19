package basi_di_dati;

import basi_di_dati.Helpers.Winecolor;
import basi_di_dati.Helpers.Winedenom;
import basi_di_dati.Helpers.Winetype;

public class TestSuite {

	public static void start() {
		System.out.println("---- TEST SUITE -----");

		// Creazione uva
		System.out.println("\n[*] Creo una nuova uva chiamata 'riesling'...");

		String winegrapeName = "Riesling";
		Winegrape.create(winegrapeName);

		System.out.println("\n[*] Stampo a video le ultime 3 uve inserite...");
		Winegrape[] winegrapes = Winegrape.getWinegrapes(3);

		for (int i = 0; i < winegrapes.length; i++)
			System.out.println(winegrapes[i].toString());

		// Creazione winefamily
		System.out.println("\n[*] Creo una nuova winefamily da associare ad un vino...");

		String winefamilyName = "nuova winefamily";
		Winefamily.create(winefamilyName, Winecolor.Rosso, Winetype.Passito, Winedenom.DOCG, 1);

		System.out.println("\n[*] Stampo a video le ultime 3 famiglie inserite...");
		Winefamily[] winefamilies = Winefamily.getWinefamilies(3);

		for (int i = 0; i < winefamilies.length; i++)
			System.out.println(winefamilies[i].toString());

		// Creazione winery
		System.out.println("\n[*] Creo una nuova winery da associare ad un vino...");

		String wineryName = "nuova winery";
		String address = "Via inventata 94";
		String telephone = "(+39) 081928348593";

		Winery.create(wineryName, address, telephone);

		System.out.println("\n[*] Stampo a video le ultime 3 famiglie inserite...");
		Winery[] wineries = Winery.getWineries(3);

		for (int i = 0; i < wineries.length; i++)
			System.out.println(wineries[i].toString());

		// Creazione vino
		System.out.println(
				"\n[*] Creo un nuovo vino con nome 'sassicaia' e annata 2017 con 10 bottiglie disponibili a un prezzo di 30€ l'una, prodotto dalla winery con id 546 e della famiglia con id 9...");

		String wineName = "sassicaia";
		Integer vintage = 2017;
		Wine.create(wineName, vintage, 10, 30, wineries[0].getId(), winefamilies[0].getId());

		// Registrazione uvaggio al vino creato
		System.out.println("\n[*] Registro un uvaggio per il vino appena creato");

		WineWinegrape.create(wineName, vintage, winegrapes[0].getId(), 100);

		System.out.println("\n[*] Cerco il vino appena inserito nel database...\n");
		Wine wine = Wine.getWine(wineName, vintage);
		System.out.println(wine.toString());

		System.out.println("\n[*] Elimino il vino appena creato...");

		WineWinegrape[] wineWinegrapes = wine.getWinegrapes();

		for (int i = 0; i < wineWinegrapes.length; i++)
			wineWinegrapes[i].destroy();

		wine.destroy();
		winegrapes[0].destroy();
		winefamilies[0].destroy();
		wineries[0].destroy();

		System.out.println("\n[*] Test completati con successo!");
	}
}
