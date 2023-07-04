using Microsoft.AspNetCore.Mvc;

namespace Hotel.Controllers
{
    public class PagesController : Controller
    {
        public IActionResult Facility()
        {
            return View();
        }
        public IActionResult Faq()
        {
            return View();
        }
    }
}
