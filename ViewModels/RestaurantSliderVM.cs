using Hotel.Models;

namespace Hotel.ViewModels
{
	public class RestaurantSliderVM : BaseEntity
	{
		public IFormFile ImageFile { get; set; } = null!;
	}
}
