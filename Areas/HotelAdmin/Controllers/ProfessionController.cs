using Hotel.DAL;
using Hotel.Models;
using Hotel.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.Areas.HotelAdmin.Controllers
{
	[Area("HotelAdmin")]
	public class ProfessionController : Controller
	{
		private readonly AppDbContext _context;

		public ProfessionController(AppDbContext context)
		{
			_context = context;
		}

		public async Task<IActionResult> Index()
		{
			return View(await _context.Professions.ToListAsync());
		}
		public IActionResult Create()
		{
			return View();
		}
		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> Create(ProfessionVM professionVM)
		{
			if (!ModelState.IsValid)
			{
				ModelState.AddModelError("", "Profession is null");
				return View();
			}
			if(professionVM == null)
			{
				ModelState.AddModelError("", "Profession is null");
				return View();
			}
			Profession profession = new Profession()
			{
				Name = professionVM.Name
			};
			await _context.Professions.AddAsync(profession);
			await _context.SaveChangesAsync();
			return RedirectToAction("Index");
		}
		public async Task<IActionResult> Edit(int id)
		{
			Profession? exist = await _context.Professions.FirstOrDefaultAsync(p => p.Id == id);
			ProfessionVM profession = new ProfessionVM()
			{
				Name = exist.Name
			};
			return View(profession);
		}
		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> Edit(ProfessionVM professionVM)
		{
			if (!ModelState.IsValid)
			{
				ModelState.AddModelError("", "Profession is null");
				return View();
			}
			Profession? exist = await _context.Professions.FirstOrDefaultAsync(p => p.Id == professionVM.Id);
			if (exist == null)
			{
				ModelState.AddModelError("", "Profession is null");
				return View();
			}
			exist.Name = professionVM.Name;
			await _context.SaveChangesAsync();
			return RedirectToAction("Index");
		}
 	}
}
