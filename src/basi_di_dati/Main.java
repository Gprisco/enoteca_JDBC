package basi_di_dati;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import basi_di_dati.Helpers.Winecolor;
import basi_di_dati.Helpers.Winedenom;
import basi_di_dati.Helpers.Winetype;

public class Main {

	public static void loading() {
		System.out.println("...");
	}

	public static String input(String question, BufferedReader keyBR) {
		System.out.print(question);
		String output = "";

		try {
			output = keyBR.readLine();
		} catch (IOException e1) {
			output = "999";
		}

		return output;
	}

	public static void handleAddWine(BufferedReader keyBR) {
		String wine = input("\nNome del vino da aggiungere: ", keyBR);

		String vintageString = "";
		String availabilityString = "";
		String priceString = "";
		String winefamilyIdString = "";
		String wineryIdString = "";

		Integer vintage = -1;
		Integer availability = -1;
		Integer price = -1;
		Integer winefamilyId = -1;
		Integer wineryId = -1;

		try {
			vintageString = input("\nAnnata: ", keyBR);
			vintage = Integer.parseInt(vintageString);

			availabilityString = input("\nQuante bottiglie? ", keyBR);
			availability = Integer.parseInt(availabilityString);

			priceString = input("\nPrezzo: ", keyBR);
			price = Integer.parseInt(priceString);

			winefamilyIdString = input("\nWinefamily ID: ", keyBR);
			winefamilyId = Integer.parseInt(winefamilyIdString);

			wineryIdString = input("\nWinery ID: ", keyBR);
			wineryId = Integer.parseInt(wineryIdString);

			if (vintage < 1 || availability < 1 || price < 1 || winefamilyId < 1 || wineryId < 1)
				throw new NumberFormatException();

			loading();

			Integer createdWine = Wine.create(wine, vintage, availability, price, wineryId, winefamilyId);

			if (createdWine > 0)
				System.out.println("\n[*] Vino creato con successo");
		} catch (NumberFormatException e) {
			System.out.println(
					"\n[!] Errore: annata, numero di bottiglie, prezzo, winefamily e winery devono essere interi maggiori di 0");
		}
	}

	public static void handleGetWines(BufferedReader keyBR) {
		String limitString = input("\nQuante righe vuoi leggere? (LIMIT): ", keyBR);

		try {
			Integer limit = Integer.parseUnsignedInt(limitString);

			loading();

			Wine[] wines = Wine.getWines(limit);

			for (int i = 0; i < wines.length; i++)
				System.out.println(wines[i].toString() + "\n----------\n");
		} catch (NumberFormatException e) {
			System.out.println("\n[!] Errore: LIMIT deve essere un intero maggiore o uguale a 0");
		}
	}

	public static void handleGetWine(BufferedReader keyBR) {
		String wineName = input("\nVino: ", keyBR);
		String vintageString = input("Annata: ", keyBR);

		Integer vintage = -1;

		try {
			vintage = Integer.parseInt(vintageString);

			if (vintage < 0)
				throw new NumberFormatException();
		} catch (NumberFormatException e) {
			System.out.println("[!] Errore: l'annata deve essere un numero intero positivo");
			return;
		}

		loading();

		Wine wine = Wine.getWine(wineName, vintage);

		if (wine == null) {
			System.out.println("Vino non trovato :(");
			return;
		}

		System.out.println(wine.toString());
	}

	public static void handleCreateWinery(BufferedReader keyBR) {
		String winery = input("\nNome: ", keyBR);
		String address = input("\nIndirizzo: ", keyBR);
		String telephone = input("\nTelefono: ", keyBR);

		loading();

		Integer createdWinery = Winery.create(winery, address, telephone);

		if (createdWinery > 0)
			System.out.println("\n[*] Winery creata con successo");
	}

	public static void handleGetWineries(BufferedReader keyBR) {
		String limitString = input("\nQuante righe vuoi leggere? (LIMIT): ", keyBR);

		try {
			Integer limit = Integer.parseUnsignedInt(limitString);

			loading();

			Winery[] wineries = Winery.getWineries(limit);

			for (int i = 0; i < wineries.length; i++)
				System.out.println(wineries[i].toString());
		} catch (NumberFormatException e) {
			System.out.println("\n[!] Errore: LIMIT deve essere un intero maggiore o uguale a 0");
		}
	}

	public static void handleCreateWinefamily(BufferedReader keyBR) {
		String winefamily = input("\nNome: ", keyBR);

		String colors = "\n\t1 - Rosso\n\t2 - Bianco\n\t3 - Rosato";
		String winecolorIdString = input(colors + "\n\nScegli un colore: ", keyBR);

		String winetypes = "\n\t1 - Passito\n\t2 - Fermo\n\t3 - SpumanteClassico\n\t4 - SpumanteCharmat\n\t5 - Frizzante\n\t6 - Liquoroso";
		String winetypeIdString = input(winetypes + "\n\nScegli una tipologia: ", keyBR);

		String winedenoms = "\n\t1 - DOCG\n\t2 - DOC\n\t3 - IGT\n\t4 - NONE";
		String winedenomIdString = input(winedenoms + "\n\nScegli una denominazione: ", keyBR);

		String regionIdString = input("\nRegione: ", keyBR);

		Integer winecolorId = -1;
		Integer winetypeId = -1;
		Integer winedenomId = -1;
		Integer regionId = -1;

		try {
			winecolorId = Integer.parseInt(winecolorIdString);
			winetypeId = Integer.parseInt(winetypeIdString);
			winedenomId = Integer.parseInt(winedenomIdString);
			regionId = Integer.parseInt(regionIdString);

			if (winecolorId < 1 || winecolorId > 3 || winetypeId < 1 || winetypeId > 6 || winedenomId < 1
					|| winedenomId > 4 || regionId < 1)
				throw new NumberFormatException();
		} catch (NumberFormatException e) {
			System.out.println(
					"\n[!] Errore: winecolorId, winetypeId, winedenomId e regionId devono essere interi maggiori o uguali a 1 e opzioni valide");
			return;
		}

		loading();

		Integer createdWinefamily = Winefamily.create(winefamily, Winecolor.values()[winecolorId - 1],
				Winetype.values()[winetypeId - 1], Winedenom.values()[winedenomId - 1], regionId);

		if (createdWinefamily > 0)
			System.out.println("\n[*] Winefamily creata con successo");
	}

	public static void handleGetWinefamilies(BufferedReader keyBR) {
		String limitString = input("\nQuante righe vuoi leggere? (LIMIT): ", keyBR);

		try {
			Integer limit = Integer.parseUnsignedInt(limitString);

			loading();

			Winefamily[] winefamilies = Winefamily.getWinefamilies(limit);

			for (int i = 0; i < winefamilies.length; i++)
				System.out.println(winefamilies[i].toString());
		} catch (NumberFormatException e) {
			System.out.println("\n[!] Errore: LIMIT deve essere un intero maggiore o uguale a 0");
		}
	}

	public static void handleCreateWinegrape(BufferedReader keyBR) {
		String winegrape = input("\nNome: ", keyBR);

		loading();

		Integer createdWinegrape = Winegrape.create(winegrape);

		if (createdWinegrape > 0)
			System.out.println("\n[*] Uva creata con successo");
	}

	public static void handleGetWinegrapes(BufferedReader keyBR) {
		String limitString = input("\nQuante righe vuoi leggere? (LIMIT): ", keyBR);

		try {
			Integer limit = Integer.parseUnsignedInt(limitString);

			loading();

			Winegrape[] winegrapes = Winegrape.getWinegrapes(limit);

			for (int i = 0; i < winegrapes.length; i++)
				System.out.println(winegrapes[i].toString());
		} catch (NumberFormatException e) {
			System.out.println("\n[!] Errore: LIMIT deve essere un intero maggiore o uguale a 0");
			return;
		}
	}

	public static void handleCreateWineWinegrapes(BufferedReader keyBR) {
		String wineName = input("\nVino: ", keyBR);
		String vintageString = input("Annata: ", keyBR);

		Integer vintage = -1;

		try {
			vintage = Integer.parseInt(vintageString);

			if (vintage < 0)
				throw new NumberFormatException();
		} catch (NumberFormatException e) {
			System.out.println("[!] Errore: l'annata deve essere un numero intero positivo");
			return;
		}

		loading();

		Wine wine = Wine.getWine(wineName, vintage);

		if (wine == null) {
			System.out.println("[!] Questo vino non esiste, prova con un altro o aggiungilo prima!");
			return;
		}

		WineWinegrape[] winegrapes = WineWinegrape.getWineWinegrapes(wineName, vintage);

		Integer sum = 0;
		for (int i = 0; i < winegrapes.length; i++)
			sum += winegrapes[i].percentage;

		if (sum == 100) {
			System.out.println(
					"[!] Il vino ha già un uvaggio completo registrato, se vuoi aggiornarlo cancella prima il precedente");
			return;
		}

		String winegrapeIdString = input("\nID Uva da aggiungere: ", keyBR);
		String percentageString = input("Percentuale: ", keyBR);

		Integer winegrapeId = -1;
		Integer percentage = -1;

		try {
			winegrapeId = Integer.parseInt(winegrapeIdString);
			percentage = Integer.parseInt(percentageString);

		} catch (NumberFormatException e) {
			System.out.println("[!] Errore: ID Uva e Percentuale devono essere numeri interi positivi");
			return;
		}

		if (percentage + sum > 100) {
			System.out.println("[!] Errore: la somma delle percentuali delle uve di questo vino supera il 100%");
			return;
		}

		loading();

		Integer createdWineWinegrape = WineWinegrape.create(wineName, vintage, winegrapeId, percentage);

		if (createdWineWinegrape > 0)
			System.out.println("[*] Uvaggio registrato con successo!");
	}

	public static void handleDestroyWineWinegrapes(BufferedReader keyBR) {
		String wineName = input("\nVino: ", keyBR);
		String vintageString = input("Annata: ", keyBR);

		Integer vintage = -1;

		try {
			vintage = Integer.parseInt(vintageString);

			if (vintage < 0)
				throw new NumberFormatException();
		} catch (NumberFormatException e) {
			System.out.println("[!] Errore: l'annata deve essere un numero intero positivo");
			return;
		}

		loading();

		Wine wine = Wine.getWine(wineName, vintage);

		if (wine == null) {
			System.out.println("[!] Questo vino non esiste, prova con un altro o aggiungilo prima!");
			return;
		}

		WineWinegrape[] winegrapes = WineWinegrape.getWineWinegrapes(wineName, vintage);

		for (int i = 0; i < winegrapes.length; i++)
			winegrapes[i].destroy();

		System.out.println("[*] Uvaggio eliminato con successo!");
	}

	public static void main(String[] args) {
		InputStreamReader keyIS;
		BufferedReader keyBR;
		Integer i = 0;
		String choice = null;

		String[] options = { "Avvia test", "Aggiungi un Vino", "Ottieni vini dal database",
				"Cerca un vino nel database", "Crea una winery", "Ottieni Wineries dal database", "Crea una Winefamily",
				"Ottieni Winefamilies dal database", "Crea una nuova uva", "Ottieni uve dal database",
				"Registra l'uvaggio di un vino", "Cancella l'uvaggio di un vino" };

		keyIS = new InputStreamReader(System.in);
		keyBR = new BufferedReader(keyIS);

		while (i != 1000) {
			System.out.println("\nOperazioni disponibili:");

			for (Integer j = 0; j < options.length; j++)
				System.out.println("\t" + Integer.toString(j + 1) + " - " + options[j]);

			System.out.println("\n\t1000 - Esci");

			choice = input("\nSeleziona un'operazione: ", keyBR);

			try {
				i = Integer.parseInt(choice);
			} catch (NumberFormatException e) {
				i = 999;
			}

			switch (i) {
			case 1: {
				TestSuite.start();
				break;
			}
			case 2: {
				handleAddWine(keyBR);
				break;
			}
			case 3: {
				handleGetWines(keyBR);
				break;
			}
			case 4: {
				handleGetWine(keyBR);
				break;
			}
			case 5: {
				handleCreateWinery(keyBR);
				break;
			}
			case 6: {
				handleGetWineries(keyBR);
				break;
			}
			case 7: {
				handleCreateWinefamily(keyBR);
				break;
			}
			case 8: {
				handleGetWinefamilies(keyBR);
				break;
			}
			case 9: {
				handleCreateWinegrape(keyBR);
				break;
			}
			case 10: {
				handleGetWinegrapes(keyBR);
				break;
			}
			case 11: {
				handleCreateWineWinegrapes(keyBR);
				break;
			}
			case 12: {
				handleDestroyWineWinegrapes(keyBR);
				break;
			}
			case 1000: {
				System.out.println("Arrivederci!");
				break;
			}
			default: {
				System.out.println("Scelta non presente");
				break;
			}
			}
		}
	}
}
