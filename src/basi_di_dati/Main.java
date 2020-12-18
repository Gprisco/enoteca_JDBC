package basi_di_dati;

public class Main {

	public static void main(String[] args) {
		try {
			System.out.println("---- TEST SUITE -----");
			System.out.println(
					"\n[*] Creo un nuovo vino con nome 'sassicaia' e annata 2017 con 10 bottiglie disponibili a un prezzo di 30€ l'una, prodotto dalla winery con id 546 e della famiglia con id 9...");

			String wineName = "sassicaia";
			Integer vintage = 2017;
			Wine.createWine(wineName, vintage, 10, 30, 546, 9);

			System.out.println("\n[*] Cerco il vino appena inserito nel database...\n");
			Wine wine = Wine.getWine(wineName, vintage);
			System.out.println(wine.toStringTest());

			System.out.println("\n[*] Elimino il vino appena creato...");
			wine.destroy();

			System.out.println("\n[*] Fine test Vino.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
