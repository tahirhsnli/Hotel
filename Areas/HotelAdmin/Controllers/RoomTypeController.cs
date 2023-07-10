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
    public class RoomTypeController : Controller
	{
		private readonly AppDbContext _context;
		private readonly IWebHostEnvironment _webHostEnvironment;

		public RoomTypeController(AppDbContext context, IWebHostEnvironment webHostEnvironment)
		{
			_context = context;
			_webHostEnvironment = webHostEnvironment;
		}

		public async Task<IActionResult> Index(int page = 1,int take = 3)
		{
			var roomtype = await _context.RoomTypes.OrderByDescending(x => x.Id).Skip((page - 1) * take).Take(take).ToListAsync();
			PaginateVM<RoomType> paginateVM = new PaginateVM<RoomType>()
			{
				Items = roomtype,
				CurrentPage = page,
				PageCount = PageCount(take)
			};
			return View(paginateVM);
		}
		private int PageCount(int take)
		{
			var count = _context.RoomTypes.Count(x => x.IsDeleted == false);
			return (int)Math.Ceiling((double)count / take);
		}
		public IActionResult Create()
		{
			return View();
		}
		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> Create(RoomTypeVM roomTypeVM)
		{
			if (!ModelState.IsValid)
			{
				ModelState.AddModelError("", "RoomType is null");
				return View();
			}
			if (roomTypeVM == null)
			{
				ModelState.AddModelError("", "RoomType is null");
				return View();
			}
			if (_context.RoomTypes.Any(p => p.Name.Trim().ToLower() == roomTypeVM.Name.Trim().ToLower()))
			{
				ModelState.AddModelError("Name", "RoomType name already exist");
				return View();
			}
			RoomType roomType = new RoomType()
			{
				Name = roomTypeVM.Name,
			};
			if (!roomTypeVM.ImageFile.CheckFile("image"))
			{
				ModelState.AddModelError("", "Image is wrong");
				return View();
			}
			if (roomTypeVM.ImageFile.CheckSize(500))
			{
				ModelState.AddModelError("", "Image is big");
				return View();
			}
			roomType.Image = await roomTypeVM.ImageFile.SaveFile(_webHostEnvironment.WebRootPath, "room");
			await _context.RoomTypes.AddAsync(roomType);
			await _context.SaveChangesAsync();
			return RedirectToAction("Index");
		}
		public async Task<IActionResult> Edit(int id)
		{
			RoomType? exist = await _context.RoomTypes.FirstOrDefaultAsync(x => x.Id == id);
			RoomTypeVM roomTypeVM = new RoomTypeVM()
			{
				Name = exist.Name
			};
			return View(roomTypeVM);
		}
		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> Edit(RoomTypeVM roomTypeVM)
		{
			if (!ModelState.IsValid)
			{
				ModelState.AddModelError("", "RoomType is null");
				return View();
			}
			RoomType? exist = await _context.RoomTypes.FirstOrDefaultAsync(x => x.Id == roomTypeVM.Id);
			if (exist == null)
			{
				ModelState.AddModelError("", "RoomType is null");
				return View();
			}
			if(roomTypeVM == null)
			{
				ModelState.AddModelError("", "RoomType is null");
				return View();
			}
			if(roomTypeVM.ImageFile != null)
			{
				if (!roomTypeVM.ImageFile.CheckFile("image"))
				{
					ModelState.AddModelError("", "Image is wrong");
					return View();
				}
				if (roomTypeVM.ImageFile.CheckSize(500))
				{
					ModelState.AddModelError("", "Image is big");
					return View();
				}
				string path = Path.Combine(_webHostEnvironment.WebRootPath, "assets", "img", "room", exist.Image);
				if (System.IO.File.Exists(path))
				{
					System.IO.File.Delete(path);
				}
				exist.Image = await roomTypeVM.ImageFile.SaveFile(_webHostEnvironment.WebRootPath, "room");
			}
			exist.Name = roomTypeVM.Name;
			await _context.SaveChangesAsync();
			return RedirectToAction("Index");
		}
	}
}
