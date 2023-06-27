using Hotel.Models;

namespace Hotel.ViewModels
{
	public class SliderVM : BaseEntity
	{
		public string Title { get; set; } = null!;
		public string Description { get; set; } = null!;
		public IFormFile? ImageFile { get; set; }
	}
}
