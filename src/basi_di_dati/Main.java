package basi_di_dati;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {

	public static void main(String[] args) {
		InputStreamReader keyIS;
		BufferedReader keyBR;
		Integer i = 0;
		String choice = null;

		keyIS = new InputStreamReader(System.in);
		keyBR = new BufferedReader(keyIS);

		while (i != 1000) {
			System.out.println("\nScegli un'opzione:");
			System.out.println("\t1 - Avvia test");
			System.out.println("\t2 - Opzione");
			System.out.println("\t1000 - Esci");

			System.out.print("\nScegli: ");

			try {
				choice = keyBR.readLine();
			} catch (IOException e1) {
				i = 999;
			}

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
				break;
			}
			case 1000: {
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
