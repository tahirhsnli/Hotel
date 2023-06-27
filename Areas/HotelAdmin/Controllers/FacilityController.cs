using Hotel.DAL;
using Hotel.Models;
using Hotel.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.Areas.HotelAdmin.Controllers
{
    [Area("HotelAdmin")]
    public class FacilityController : Controller
    {
        private readonly AppDbContext _context;

        public FacilityController(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _context.Facilities.Where(x=>x.IsDeleted==false).ToListAsync());
        }
        public IActionResult Create() 
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(FacilityVM facilityVM)
        {
            if(!ModelState.IsValid)
            {
                ModelState.AddModelError("", "Facility is null");
                return View();
            }
            if(facilityVM == null)
            {
                ModelState.AddModelError("", "Facility is null");
                return View();
            }
            Facility facility = new Facility()
            {
                Title = facilityVM.Title,
                Description = facilityVM.Description,
                Icon = facilityVM.Icon
            };
            await _context.Facilities.AddAsync(facility);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Edit(int id)
        {
            Facility? exist = await _context.Facilities.Where(x=>x.IsDeleted==false).FirstOrDefaultAsync(x => x.Id == id);
            FacilityVM facility = new FacilityVM()
            {
                Title = exist.Title,
                Description = exist.Description,
                Icon = exist.Icon
            };
            return View(facility);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(FacilityVM facilityVM)
        {
			if (!ModelState.IsValid)
			{
				ModelState.AddModelError("", "Facility is null");
				return View();
			}
			Facility? exist = await _context.Facilities.Where(x => x.IsDeleted == false).FirstOrDefaultAsync(x => x.Id == facilityVM.Id);
			if (exist == null)
			{
				ModelState.AddModelError("", "Facility is null");
				return View();
			}
            exist.Title = facilityVM.Title;
            exist.Description = facilityVM.Description;
            exist.Icon = facilityVM.Icon;
			await _context.SaveChangesAsync();
			return RedirectToAction("Index");
		}
    }
}
