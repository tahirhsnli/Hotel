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
    public class HeaderSectionsController : Controller
    {
        private readonly AppDbContext _context;

        public HeaderSectionsController(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _context.HeaderSections.ToListAsync());
        }
        public async Task<IActionResult> Edit(int id)
        {
            var header = await _context.HeaderSections.FirstOrDefaultAsync(x => x.Id == id);
            if(header == null)
            {
                ModelState.AddModelError("", "Header Section is null");
                return View();
            }
            HeaderSectionVM sectionVM = new HeaderSectionVM()
            {
                Value = header.Value
            };
            return View(sectionVM);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(HeaderSectionVM sectionVM)
        {
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError("", "Header Section is null");
                return View();
            }
            HeaderSection? exist = await _context.HeaderSections.FirstOrDefaultAsync(x => x.Id == sectionVM.Id);
            if (exist == null)
            {
                ModelState.AddModelError("", "Header Section is null");
                return View();
            }
            exist.Value = sectionVM.Value;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
    }
}
