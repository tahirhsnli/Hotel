using Hotel.DAL;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.Areas.HotelAdmin.Controllers
{
	[Area("HotelAdmin")]
	public class RoomController : Controller
	{
		private readonly AppDbContext _context;

		public RoomController(AppDbContext context)
		{
			_context = context;
		}

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
