using Hotel.DAL;
using Hotel.Extension;
using Hotel.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;

namespace Hotel.Areas.HotelAdmin.Controllers
{
	[Area("HotelAdmin")]
	public class RoomController : Controller
	{
		private readonly AppDbContext _context;
		private readonly IWebHostEnvironment _environment;
		public RoomController(AppDbContext context, IWebHostEnvironment environment)
		{
			_context = context;
            _environment = environment;
        }
        public async Task<IActionResult> Index()
		{
			ViewBag.RoomType = await _context.RoomTypes.ToListAsync();
			var rooms = await _context.Rooms
							  .Include(x => x.RoomType).Include(x => x.Bookings).Include(x => x.RoomImages)
							  .ToListAsync();
            return View(rooms);
		}
		public async Task<IActionResult> Create()
		{
			ViewBag.RoomType = await _context.RoomTypes.ToListAsync();
			return View();
		}
		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> Create(Room room)
		{
			ViewBag.RoomType = await _context.RoomTypes.ToListAsync();
			if (!ModelState.IsValid)
			{
				ModelState.AddModelError("", "Room is null");
				return View();
			}
			if(room == null)
			{
                ModelState.AddModelError("", "Room is null");
                return View();
            }
			if(room.MainFile == null)
			{
                ModelState.AddModelError("MainFile", "Image is null");
                return View();
            }
			if (!room.MainFile.CheckFile("image"))
			{
                ModelState.AddModelError("", "Image is wrong type");
                return View();
            }
			if (room.MainFile.CheckSize(200))
			{
                ModelState.AddModelError("", "Image is big");
                return View();
            }
			room.RoomImages = new List<RoomImage>();
			room.RoomImages.Add(new RoomImage
			{
				Image = await room.MainFile.SaveFile(_environment.WebRootPath, "room"),
				IsMain = true,
				Room = room
			});
			foreach (var image in room.Files)
			{
                if (!room.MainFile.CheckFile("image"))
                {
                    ModelState.AddModelError("", "Image is wrong type");
                    return View();
                }
                if (room.MainFile.CheckSize(200))
                {
                    ModelState.AddModelError("", "Image is big");
                    return View();
                }
				room.RoomImages.Add(new RoomImage
				{
					Image = await image.SaveFile(_environment.WebRootPath, "room"),
					IsMain = false,
					Room = room
				});
            }
			Room rom = new Room()
			{
				RoomNumber = room.RoomNumber,
				RoomPrice = room.RoomPrice,
				ChildrenCapacity = room.ChildrenCapacity,
				PeopleCapacity = room.PeopleCapacity,
				RoomTypeId = room.RoomTypeId,
				Area = room.Area,
				RoomImages = room.RoomImages,
				IsAnimal = false,
				IsBalcony = false,
				IsDeleted = false,
				IsExist = false,
			};
            await _context.Rooms.AddAsync(rom);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");

        }
		public IActionResult Edit()
		{
			return View();
		}

	}
}
