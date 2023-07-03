using Hotel.DAL;
using Hotel.Models;
using Hotel.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace Hotel.Areas.HotelAdmin.Controllers
{
	[Area("HotelAdmin")]
    [Authorize(Roles = "admin")]
    public class BookingController : Controller
	{
		private readonly AppDbContext _context;

        public BookingController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
		{
			return View();
		}
		public async Task<IActionResult> PendingBooking()
		{
			return View(await _context.Bookings.Include(x=>x.Room).Where(b=>b.Status == null).ToListAsync());
		}
		public async Task<IActionResult> BookingEdit(int id)
		{
			return View(await _context.Bookings.FirstOrDefaultAsync(x=>x.Id == id));
		}
		public async Task<IActionResult> Accept(int id)
		{
			if (!ModelState.IsValid) { return View(); }
			Bookings? exist = await _context.Bookings.FirstOrDefaultAsync(x => x.Id == id);
			if (exist == null)
			{
				ModelState.AddModelError("", "Error");
				return View();
			}
			exist.Status = true;
			await _context.SaveChangesAsync();
			return RedirectToAction("PendingBooking");
		}
		public async Task<IActionResult> Reject(int id)
		{
			if (!ModelState.IsValid) { return View(); }
			Bookings? exist = await _context.Bookings.FirstOrDefaultAsync(x => x.Id == id);
			if (exist == null)
			{
				ModelState.AddModelError("", "Error");
				return View();
			}
			exist.Status = false;
			await _context.SaveChangesAsync();
			return RedirectToAction("PendingBooking");
		}
	}
}
