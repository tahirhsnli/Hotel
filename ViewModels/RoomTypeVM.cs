using Hotel.Models;

namespace Hotel.ViewModels
{
	public class RoomTypeVM : BaseEntity
	{
		public string Name { get; set; } = null!;
		public IFormFile ImageFile { get; set; } = null!;
	}
}
