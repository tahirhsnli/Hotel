using Hotel.DAL;
using Hotel.Extension;
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
	public class SpaSliderController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _env;
        public SpaSliderController(AppDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _context.SpaSliders.ToListAsync());
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(SpaSliderVM sliderVM)
        {
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError("", "Slider is null");
                return View();
            }
            if (sliderVM == null)
            {
                ModelState.AddModelError("", "Slider is null");
                return View();
            }
            if (sliderVM.ImageFile == null)
            {
                ModelState.AddModelError("ImageFile", "Image is null");
                return View();
            }
            if (sliderVM.ImageFile.CheckSize(500))
            {
                ModelState.AddModelError("ImageFile", "Image size big");
                return View();
            }
            if (!sliderVM.ImageFile.CheckFile("image"))
            {
                ModelState.AddModelError("ImageFile", "This is not Image");
                return View();
            }
            SpaSlider slider = new SpaSlider();
            slider.Image = await sliderVM.ImageFile.SaveFile(_env.WebRootPath, "spa");
            await _context.SpaSliders.AddAsync(slider);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Edit(int id)
        {
            SpaSlider? exist = await _context.SpaSliders.FirstOrDefaultAsync(x => x.Id == id);
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(SpaSliderVM sliderVM)
        {
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError("", "Slider is null");
                return View();
            }
            SpaSlider? exist = await _context.SpaSliders.FirstOrDefaultAsync(x => x.Id == sliderVM.Id);
            if (exist == null)
            {
                ModelState.AddModelError("", "Slider is null");
                return View();
            }
            if (sliderVM.ImageFile != null)
            {
                if (sliderVM.ImageFile.CheckSize(500))
                {
                    ModelState.AddModelError("ImageFile", "Image is big");
                    return View();
                }
                if (!sliderVM.ImageFile.CheckFile("image"))
                {
                    ModelState.AddModelError("ImageFile", "Image is wrong type");
                    return View();
                }
                string path = Path.Combine(_env.WebRootPath, "assets", "img", "spa", exist.Image);
                if (System.IO.File.Exists(path))
                {
                    System.IO.File.Delete(path);
                }
                exist.Image = await sliderVM.ImageFile.SaveFile(_env.WebRootPath, "spa");
            }
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Delete(int id)
        {
            SpaSlider? exist = await _context.SpaSliders.FirstOrDefaultAsync(x => x.Id == id);
            if (exist == null)
            {
                ModelState.AddModelError("", "Slider is null");
                return View();
            }
            _context.SpaSliders.Remove(exist);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
    }
}
