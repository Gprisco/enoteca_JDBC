package basi_di_dati;

public class Models {

	public static class Wine extends Object {
		public String wine;
		public Integer vintage;
		public Integer availability;
		public Float price;
		public Integer wineryId;
		public Integer winefamilyId;

		public Wine(String wine, Integer vintage, Integer availability, Float price, Integer wineryId,
				Integer winefamilyId) {
			this.wine = wine;
			this.vintage = vintage;
			this.availability = availability;
			this.price = price;
			this.wineryId = wineryId;
			this.winefamilyId = winefamilyId;
		}
	}
}
