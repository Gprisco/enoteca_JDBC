package basi_di_dati;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

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
				System.out.println(wines[i].toString());
		} catch (NumberFormatException e) {
			System.out.println("\n[!] Errore: LIMIT deve essere un intero maggiore o uguale a 0");
		}
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

	public static void main(String[] args) {
		InputStreamReader keyIS;
		BufferedReader keyBR;
		Integer i = 0;
		String choice = null;

		String[] options = { "1 - Avvia test", "2 - Aggiungi un Vino", "3 - Ottieni vini dal database",
				"4 - Crea una winery", "1000 - Esci" };

		keyIS = new InputStreamReader(System.in);
		keyBR = new BufferedReader(keyIS);

		while (i != 1000) {
			System.out.println("\nScegli un'opzione:");

			for (Integer j = 0; j < options.length; j++)
				System.out.println("\t" + options[j]);

			choice = input("\nScegli: ", keyBR);

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
				handleCreateWinery(keyBR);
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
