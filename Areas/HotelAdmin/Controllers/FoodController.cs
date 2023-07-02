using Microsoft.AspNetCore.Mvc;

namespace Hotel.Areas.HotelAdmin.Controllers
{
    public class FoodController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
