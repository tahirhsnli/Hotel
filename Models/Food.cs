namespace Hotel.Models
{
	public class Food : BaseEntity
	{
        public string Name { get; set; } = null!;
        public string Description { get; set; } = null!;
        public decimal Price { get; set; }
        public bool IsDeleted { get; set; }
        public int FoodTypeId { get; set; }
        public FoodType? FoodType { get; set; }

    }
}
