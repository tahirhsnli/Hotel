using Microsoft.AspNetCore.Mvc;

namespace Hotel.Areas.HotelAdmin.Controllers
{
    public class FoodTypeController : Controller
    {
        public async Task<IActionResult> Index()
        {
            return View();
        }
    }
}
