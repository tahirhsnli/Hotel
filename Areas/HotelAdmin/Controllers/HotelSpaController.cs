using Hotel.DAL;
using Hotel.Models;
using Hotel.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace Hotel.Areas.HotelAdmin.Controllers;

	[Area("HotelAdmin")]
	[Authorize(Roles = "admin")]
public class HotelSpaController : Controller
{
	private readonly AppDbContext _context;

    public HotelSpaController(AppDbContext context)
    {
        _context = context;
    }

    public async Task<IActionResult> Index()
    {
        return View(await _context.Spa.ToListAsync());
    }
    public async Task<IActionResult> Edit(int id)
    {
        Spa? exist = await _context.Spa.FirstOrDefaultAsync(x => x.Id == id);
        SpaVM spa = new SpaVM()
        {
            Value = exist.Value
        };
        return View(spa);
    }
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(SpaVM spaVM)
    {
        if (!ModelState.IsValid)
        {
            ModelState.AddModelError("", "Spa is null");
            return View();
        }
        Spa? exist = await _context.Spa.FirstOrDefaultAsync(x => x.Id == spaVM.Id);
        if (exist == null)
        {
            ModelState.AddModelError("", "Value is null");
            return View();
        }
        exist.Value = spaVM.Value;
        await _context.SaveChangesAsync();
        return RedirectToAction("Index");
    }
}
