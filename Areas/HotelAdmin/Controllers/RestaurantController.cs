using Microsoft.AspNetCore.Mvc;

namespace Hotel.Areas.HotelAdmin.Controllers
{
    public class RestaurantController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
