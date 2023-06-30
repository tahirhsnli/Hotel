using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace Hotel.Areas.HotelAdmin.Controllers
{
	[Area("HotelAdmin")]
    [Authorize(Roles = "admin")]
    public class BookingController : Controller
	{
		public IActionResult Index()
		{
			return View();
		}
		public IActionResult Create()
		{
			return View();
		}
		public IActionResult Edit()
		{
			return View();
		}
	}
}
