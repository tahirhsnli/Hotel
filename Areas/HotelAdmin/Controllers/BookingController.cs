using Hotel.DAL;
using Hotel.Models;
using Hotel.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
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

        public async Task<IActionResult> Index(int page = 1,int take = 10)
		{
			var bookings = await _context.Bookings.Where(b => b.Status == true).OrderByDescending(x => x.Id).Include(x => x.Room).Include(x => x.AppUser)
				.Skip((page - 1) * take).Take(take).ToListAsync();
			PaginateVM<Bookings> paginate = new PaginateVM<Bookings>()
			{
				Items = bookings,
				CurrentPage = page,
				PageCount =PageCount1(take)
			};
			return View(paginate);
		}
		private int PageCount1(int take)
		{
			var count = _context.Bookings.Count(x => x.Status == true);
			return (int)Math.Ceiling((double)count / take);
		}
		public async Task<IActionResult> PendingBooking(int page = 1,int take = 10)
		{
			var bookings = await _context.Bookings.Where(b => b.Status == null).OrderByDescending(x => x.Id).Include(x => x.Room).Skip((page-1)*take).Take(take).ToListAsync();
			PaginateVM<Bookings> paginate = new PaginateVM<Bookings>()
			{
				Items = bookings,
				CurrentPage = page,
				PageCount = PageCount2(take)
			};
			return View(paginate);
		}
		private int PageCount2(int take)
		{
			var count = _context.Bookings.Count(x => x.Status == null);
			return (int)Math.Ceiling((double)count / take);
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
