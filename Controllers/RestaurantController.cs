using Microsoft.AspNetCore.Mvc;

namespace Hotel.Controllers
{
	public class RestaurantController : Controller
	{
		public IActionResult Index()
		{
			return View();
		}
	}
}
