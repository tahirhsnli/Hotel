using Hotel.DAL;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace Hotel.Areas.HotelAdmin.Controllers
{
    [Area("HotelAdmin")]
    [Authorize(Roles = "admin")]
    public class DashBoardController : Controller
    {
        private readonly AppDbContext _context;

		public DashBoardController(AppDbContext context)
		{
			_context = context;
		}

		public async Task<IActionResult> Index()
        {
            return View(await _context.Rooms.Where(x=>x.IsDeleted == false).Include(x=>x.Bookings).ToListAsync());
        }
    }
}
