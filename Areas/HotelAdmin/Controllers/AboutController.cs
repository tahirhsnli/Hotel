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
    public class AboutController : Controller
	{
		private readonly AppDbContext _context;

		public AboutController(AppDbContext context)
		{
			_context = context;
		}

		public async Task<IActionResult> Index()
		{
			return View(await _context.Abouts.OrderByDescending(x => x.Id).ToListAsync());
		}
		public async Task<IActionResult> Edit(int id)
		{
			About? exist= await _context.Abouts.FirstOrDefaultAsync(x => x.Id == id);
			AboutVM about = new AboutVM()
			{
				Value = exist.Value
			};
			return View(about);
		}
		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> Edit(AboutVM aboutVM)
		{
			if (!ModelState.IsValid)
			{
				ModelState.AddModelError("", "About is null");
				return View();
			}
			About? exist = await _context.Abouts.FirstOrDefaultAsync(x => x.Id == aboutVM.Id);
			if (exist == null)
			{
				ModelState.AddModelError("", "Value is null");
				return View();
			}
			exist.Value = aboutVM.Value;
			await _context.SaveChangesAsync();
			return RedirectToAction("Index");
		}
	}
}
