package basi_di_dati;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import basi_di_dati.Helpers.Winecolor;
import basi_di_dati.Helpers.Winedenom;
import basi_di_dati.Helpers.Winetype;

public class CLI {
	InputStreamReader keyIS;
	BufferedReader keyBR;

	WineHandler wineHandler;
	WineryHandler wineryHandler;
	WinefamilyHandler winefamilyHandler;
	WinegrapeHandler winegrapeHandler;
	WineWinegrapeHandler wineWinegrapeHandler;

	public CLI() {
		keyIS = new InputStreamReader(System.in);
		keyBR = new BufferedReader(keyIS);

		wineHandler = new WineHandler();
		wineryHandler = new WineryHandler();
		winefamilyHandler = new WinefamilyHandler();
		winegrapeHandler = new WinegrapeHandler();
		wineWinegrapeHandler = new WineWinegrapeHandler();
	}

	public void loading() {
		System.out.println("...");
	}

	public String input(String question) {
		System.out.print(question);
		String output = "";

		try {
			output = keyBR.readLine();
		} catch (IOException e1) {
			output = "999";
		}

		return output;
	}

	public class WineHandler {

		public void handleAddWine() {
			String wine = input("\nNome del vino da aggiungere: ");

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
				vintageString = input("\nAnnata: ");
				vintage = Integer.parseInt(vintageString);

				availabilityString = input("\nQuante bottiglie? ");
				availability = Integer.parseInt(availabilityString);

				priceString = input("\nPrezzo: ");
				price = Integer.parseInt(priceString);

				winefamilyIdString = input("\nWinefamily ID: ");
				winefamilyId = Integer.parseInt(winefamilyIdString);

				wineryIdString = input("\nWinery ID: ");
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

		public void handleGetWines() {
			String limitString = input("\nQuante righe vuoi leggere? (LIMIT): ");

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

		public void handleGetWine() {
			String wineName = input("\nVino: ");
			String vintageString = input("Annata: ");

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

		public void handleDestroyWine() {
			String wineName = input("\nVino: ");
			String vintageString = input("Annata: ");

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

			Integer deletedWine = wine.destroy();

			if (deletedWine > 0)
				System.out.println("[*] Vino eliminato con successo!");
		}
	}

	public class WineryHandler {

		public void handleCreateWinery() {
			String winery = input("\nNome: ");
			String address = input("\nIndirizzo: ");
			String telephone = input("\nTelefono: ");

			loading();

			Integer createdWinery = Winery.create(winery, address, telephone);

			if (createdWinery > 0)
				System.out.println("\n[*] Winery creata con successo");
		}

		public void handleGetWineries() {
			String limitString = input("\nQuante righe vuoi leggere? (LIMIT): ");

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

		public void handleDestroyWinery() {
			String wineryIdString = input("\nID Winery: ");

			try {
				Integer wineryId = Integer.parseInt(wineryIdString);

				if (wineryId < 0)
					throw new NumberFormatException();

				loading();

				Winery w = Winery.getWinery(wineryId);

				if (w == null) {
					System.out.println("[!] Questa winery non  esiste :(");
					return;
				}

				Integer deletedWinery = w.destroy();

				if (deletedWinery > 0)
					System.out.println("[*] Winery e relativi vini eliminati con successo!");
			} catch (NumberFormatException e) {
				System.out.println("\n[!] Errore: wineryId deve essere un intero maggiore di 0");
			}
		}
	}

	public class WinefamilyHandler {

		public void handleCreateWinefamily() {
			String winefamily = input("\nNome: ");

			String colors = "\n\t1 - Rosso\n\t2 - Bianco\n\t3 - Rosato";
			String winecolorIdString = input(colors + "\n\nScegli un colore: ");

			String winetypes = "\n\t1 - Passito\n\t2 - Fermo\n\t3 - SpumanteClassico\n\t4 - SpumanteCharmat\n\t5 - Frizzante\n\t6 - Liquoroso";
			String winetypeIdString = input(winetypes + "\n\nScegli una tipologia: ");

			String winedenoms = "\n\t1 - DOCG\n\t2 - DOC\n\t3 - IGT\n\t4 - NONE";
			String winedenomIdString = input(winedenoms + "\n\nScegli una denominazione: ");

			String regionIdString = input("\nRegione: ");

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

		public void handleGetWinefamilies() {
			String limitString = input("\nQuante righe vuoi leggere? (LIMIT): ");

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

		public void handleDestroyWinefamily() {
			String winefamilyIdString = input("\nID Winefamily: ");

			try {
				Integer winefamilyId = Integer.parseUnsignedInt(winefamilyIdString);

				if (winefamilyId < 1)
					throw new NumberFormatException();

				loading();

				Winefamily wf = Winefamily.getWinefamily(winefamilyId);

				if (wf == null) {
					System.out.println("[!] Questa winefamily non esiste!");
					return;
				}

				Integer deletedWinefamily = wf.destroy();

				if (deletedWinefamily > 0)
					System.out.println("[*] Winefamily e relativi vini eliminati con successo");
			} catch (NumberFormatException e) {
				System.out.println("\n[!] Errore: winefamilyId deve essere un intero maggiore di 0");
			}

		}
	}

	public class WinegrapeHandler {
		public void handleCreateWinegrape() {
			String winegrape = input("\nNome: ");

			loading();

			Integer createdWinegrape = Winegrape.create(winegrape);

			if (createdWinegrape > 0)
				System.out.println("\n[*] Uva creata con successo");
		}

		public void handleGetWinegrapes() {
			String limitString = input("\nQuante righe vuoi leggere? (LIMIT): ");

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
	}

	public class WineWinegrapeHandler {
		public void handleCreateWineWinegrapes() {
			String wineName = input("\nVino: ");
			String vintageString = input("Annata: ");

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

			String winegrapeIdString = input("\nID Uva da aggiungere: ");
			String percentageString = input("Percentuale: ");

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

		public void handleDestroyWineWinegrapes() {
			String wineName = input("\nVino: ");
			String vintageString = input("Annata: ");

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
	}
}
