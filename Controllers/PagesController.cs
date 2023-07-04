using Microsoft.AspNetCore.Mvc;

namespace Hotel.Controllers
{
    public class PagesController : Controller
    {
        public IActionResult Services()
        {
            return View();
        }
        public IActionResult Facilities()
        {
            return View();
        }
    }
}
