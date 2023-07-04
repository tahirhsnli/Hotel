using Microsoft.AspNetCore.Mvc;

namespace Hotel.Controllers
{
    public class SpaController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
