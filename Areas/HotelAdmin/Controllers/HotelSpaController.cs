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
        Restaurant? exist = await _context.Restaurant.FirstOrDefaultAsync(x => x.Id == id);
        RestaurantVM restaurant = new RestaurantVM()
        {
            Value = exist.Value
        };
        return View(restaurant);
    }
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(RestaurantVM restaurantVM)
    {
        if (!ModelState.IsValid)
        {
            ModelState.AddModelError("", "About is null");
            return View();
        }
        Restaurant? exist = await _context.Restaurant.FirstOrDefaultAsync(x => x.Id == restaurantVM.Id);
        if (exist == null)
        {
            ModelState.AddModelError("", "Value is null");
            return View();
        }
        exist.Value = restaurantVM.Value;
        await _context.SaveChangesAsync();
        return RedirectToAction("Index");
    }
}
