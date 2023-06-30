using Microsoft.AspNetCore.Mvc;

namespace Hotel.Controllers
{
    public class OrderController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
