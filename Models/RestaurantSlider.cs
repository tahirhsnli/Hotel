namespace Hotel.Models
{
	public class RestaurantSlider : BaseEntity
	{
		public bool IsDeleted { get; set; }
		public string Image { get; set; } = null!;
	}
}
