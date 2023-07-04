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
	public class ServicesController : Controller
    {
        private readonly AppDbContext _context;

        public ServicesController(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _context.Services.ToListAsync());
        }
        public async Task<IActionResult> Edit(int id)
        {
            Services? exist = await _context.Services.FirstOrDefaultAsync(x => x.Id == id);
            ServicesVM service = new ServicesVM()
            {
                Value = exist.Value
            };
            return View(service);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(ServicesVM services)
        {
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError("", "Service is null");
                return View();
            }
            Services? exist = await _context.Services.FirstOrDefaultAsync(x => x.Id == services.Id);
            if (exist == null)
            {
                ModelState.AddModelError("", "Value is null");
                return View();
            }
            exist.Value = services.Value;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
    }
}
