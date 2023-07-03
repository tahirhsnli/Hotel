using Microsoft.AspNetCore.Mvc;

namespace Hotel.Areas.HotelAdmin.Controllers;

public class SpaController : Controller
{
    public IActionResult Index()
    {
        return View();
    }
}
