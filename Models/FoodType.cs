namespace Hotel.Models
{
	public class FoodType : BaseEntity
	{
		public string Name { get; set; } = null!;
        public bool IsDeleted { get; set; }
        public List<Food>? Foods { get; set; }
    }
}
