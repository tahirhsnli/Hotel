using Hotel.DAL;
using Hotel.Models;
using Hotel.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.Areas.HotelAdmin.Controllers
{
    [Area("HotelAdmin")]
    public class SettingController : Controller
    {
        private readonly AppDbContext _context;

        public SettingController(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _context.Settings.ToListAsync());
        }
        public async Task<IActionResult> Search(string key,string value)
        {
			ViewData["key"] = key;
            ViewData["value"] = value;
			var settings = from s in _context.Settings select s;

			if (!string.IsNullOrEmpty(key))
			{
				settings = settings.Where(x => x.Key.Contains(key));
			}
            if (!string.IsNullOrEmpty(value))
            {
                settings = settings.Where(x=>x.Value.Contains(value));
            }
			return View(settings);
		}
        public async Task<IActionResult> Edit(int id)
        {
            Setting? exist = await _context.Settings.FirstOrDefaultAsync(x => x.Id == id);
            SettingVM setting = new SettingVM()
            {
                Value = exist.Value
            };
            return View(setting);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(SettingVM setting)
        {
            if(!ModelState.IsValid)
            {
                ModelState.AddModelError("", "Setting is null");
                return View();
            }
            Setting? exist = await _context.Settings.FirstOrDefaultAsync(x => x.Id == setting.Id);
            if(exist == null)
            {
                ModelState.AddModelError("", "Value is null");
                return View();
            }
            exist.Value = setting.Value;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
    }
}
