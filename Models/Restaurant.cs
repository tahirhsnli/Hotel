namespace Hotel.Models
{
	public class Restaurant : BaseEntity
	{
		public string Name { get; set; } = null!;
		public string Description { get; set; } = null!;
        public List<FoodType>? FoodTypes { get; set; }
    }
}
