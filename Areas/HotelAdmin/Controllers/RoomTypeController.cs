using Microsoft.AspNetCore.Mvc;

namespace Hotel.Areas.HotelAdmin.Controllers
{
	public class RoomTypeController : Controller
	{
		public IActionResult Index()
		{
			return View();
		}
	}
}
