package basi_di_dati;

public class Main {

	public static void main(String[] args) {
		Integer i = 0;
		String choice = null;

		String[] options = { "Avvia test", "Aggiungi un Vino", "Ottieni vini dal database",
				"Cerca un vino nel database", "Crea una winery", "Ottieni Wineries dal database", "Crea una Winefamily",
				"Ottieni Winefamilies dal database", "Crea una nuova uva", "Ottieni uve dal database",
				"Registra l'uvaggio di un vino", "Cancella l'uvaggio di un vino" };

		CLI cli = new CLI();

		while (i != 1000) {
			System.out.println("\nOperazioni disponibili:");

			for (Integer j = 0; j < options.length; j++)
				System.out.println("\t" + Integer.toString(j + 1) + " - " + options[j]);

			System.out.println("\n\t1000 - Esci");

			choice = cli.input("\nSeleziona un'operazione: ");

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
				cli.wineHandler.handleAddWine();
				break;
			}
			case 3: {
				cli.wineHandler.handleGetWines();
				break;
			}
			case 4: {
				cli.wineHandler.handleGetWine();
				break;
			}
			case 5: {
				cli.wineryHandler.handleCreateWinery();
				break;
			}
			case 6: {
				cli.wineryHandler.handleGetWineries();
				break;
			}
			case 7: {
				cli.winefamilyHandler.handleCreateWinefamily();
				break;
			}
			case 8: {
				cli.winefamilyHandler.handleGetWinefamilies();
				break;
			}
			case 9: {
				cli.winegrapeHandler.handleCreateWinegrape();
				break;
			}
			case 10: {
				cli.winegrapeHandler.handleGetWinegrapes();
				break;
			}
			case 11: {
				cli.wineWinegrapeHandler.handleCreateWineWinegrapes();
				break;
			}
			case 12: {
				cli.wineWinegrapeHandler.handleDestroyWineWinegrapes();
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
