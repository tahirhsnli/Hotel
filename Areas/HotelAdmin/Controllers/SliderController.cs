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
    public class SliderController : Controller
	{
		private readonly AppDbContext _context;
		private readonly IWebHostEnvironment _env;
		public SliderController(AppDbContext context, IWebHostEnvironment env)
		{
			_context = context;
			_env = env;
		}

		public async Task<IActionResult> Index()
		{
			return View(await _context.Sliders.Where(x => x.IsDeleted == false).ToListAsync());
		}
		public IActionResult Create() 
		{
			return View();
		}
		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> Create(SliderVM sliderVM)
		{
			if(!ModelState.IsValid)
			{
				ModelState.AddModelError("", "Slider is null");
				return View();
			}
			if(sliderVM == null)
			{
				ModelState.AddModelError("", "Slider is null");
				return View();
			}
			Slider slider = new Slider()
			{
				Title= sliderVM.Title,
				Description=sliderVM.Description,
			};
			if(sliderVM.ImageFile == null)
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
			slider.Image = await sliderVM.ImageFile.SaveFile(_env.WebRootPath, "slider");
			await _context.Sliders.AddAsync(slider);
			await _context.SaveChangesAsync();
			return RedirectToAction("Index");
		}
		public async Task<IActionResult> Edit(int id)
		{
			Slider? exist = await _context.Sliders.Where(x=>x.IsDeleted == false).FirstOrDefaultAsync(x => x.Id == id);
			SliderVM sliderVM = new SliderVM() 
			{
				Title = exist.Title,
				Description=exist.Description,
			};
			return View(sliderVM);
		}
		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> Edit(SliderVM sliderVM)
		{
			if (!ModelState.IsValid)
			{
				ModelState.AddModelError("", "Slider is null");
				return View();
			}
			Slider? exist = await _context.Sliders.Where(x => x.IsDeleted == false).FirstOrDefaultAsync(x => x.Id == sliderVM.Id);
			if(exist == null)
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
				string path = Path.Combine(_env.WebRootPath, "assets", "img", "slider", exist.Image);
				if (System.IO.File.Exists(path))
				{
					System.IO.File.Delete(path);
				}
				exist.Image = await sliderVM.ImageFile.SaveFile(_env.WebRootPath, "slider");
			}
			exist.Title = sliderVM.Title;
			exist.Description = sliderVM.Description;
			await _context.SaveChangesAsync();
			return RedirectToAction("Index");
		}
		public async Task<IActionResult> Delete(int id)
		{
			Slider? exist = await _context.Sliders.Where(x => x.IsDeleted == false).FirstOrDefaultAsync(x => x.Id == id);
			if (exist == null)
			{
				ModelState.AddModelError("", "Slider is null");
				return View();
			}
			string path = Path.Combine(_env.WebRootPath, "assets", "img", "slider", exist.Image);
			if (System.IO.File.Exists(path))
			{
				System.IO.File.Delete(path);
			}
			exist.IsDeleted = true;
			await _context.SaveChangesAsync();
			return RedirectToAction("Index");
		}
	}
}
