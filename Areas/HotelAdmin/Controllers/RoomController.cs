using Hotel.DAL;
using Hotel.Extension;
using Hotel.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Security.Cryptography;

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
			var rooms = await _context.Rooms.Where(x=>x.IsDeleted == false)
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
		public async Task<IActionResult> Edit(int id)
		{
			ViewBag.RoomType = await _context.RoomTypes.ToListAsync();
			var rooms = await _context.Rooms
							  .Include(x => x.RoomType).Include(x => x.Bookings).Include(x => x.RoomImages)
							  .FirstOrDefaultAsync(x=>x.Id == id);
			return View(rooms);
		}
		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> Edit(Room room)
		{
			ViewBag.RoomType = await _context.RoomTypes.ToListAsync();
			if (!ModelState.IsValid) 
			{
				ModelState.AddModelError("", "Room is null");
				return View();
			}
			Room? exist = await _context.Rooms
							  .Include(x => x.RoomType).Include(x => x.Bookings).Include(x => x.RoomImages)
							  .FirstOrDefaultAsync(x => x.Id == room.Id);
			if(exist == null)
			{
				ModelState.AddModelError("", "Room is null");
				return View();
			}
			if(room.RoomNumber < 0) 
			{
				ModelState.AddModelError("RoomNumber", "RoomNumber is wrong");
				return View();
			}
			if(room.RoomPrice < 50) 
			{
				ModelState.AddModelError("RoomPrice", "Room Price very low");
				return View();
			}
			if(room.ChildrenCapacity < 0 && room.ChildrenCapacity > 5) 
			{
				ModelState.AddModelError("ChildrenCapacity", "Children Capacity big or wrong capacity");
				return View();
			}
			if (room.PeopleCapacity < 0 && room.PeopleCapacity > 5)
			{
				ModelState.AddModelError("PeopleCapacity", "People Capacity big");
				return View();
			}
			exist.Area = room.Area;
			exist.PeopleCapacity = room.PeopleCapacity;
			exist.ChildrenCapacity = room.ChildrenCapacity;
			exist.RoomNumber = room.RoomNumber;
			exist.RoomPrice = room.RoomPrice;
			exist.RoomTypeId = room.RoomTypeId;
			if (room.MainFile != null)
			{
				if (!room.MainFile.CheckFile("image"))
				{
					ModelState.AddModelError("", "Image is wrong");
					return View();
				}
				if (room.MainFile.CheckSize(200))
				{
					ModelState.AddModelError("", "Image is big");
					return View();
				}
				string path = Path.Combine(_environment.WebRootPath, "assets", "img", "room", exist.RoomImages.Where(x=>x.IsMain==true).FirstOrDefault().Image);
				if (System.IO.File.Exists(path))
				{
					System.IO.File.Delete(path);
				}
				var savedFile = await room.MainFile.SaveFile(_environment.WebRootPath, "room");
				exist.RoomImages.FirstOrDefault(pi => pi.IsMain  == true).Image = savedFile;
			}
			if (room.Files != null)
			{
				foreach (var file in room.Files)
				{
					if (!file.CheckFile("image"))
					{
						ModelState.AddModelError("", "Image is wrong");
						return View();
					}
					if (file.CheckSize(2000))
					{
						ModelState.AddModelError("", "Image is big");
						return View();
					}
					exist.RoomImages.Add(new RoomImage
					{
						Image = await file.SaveFile(_environment.WebRootPath, "room"),
						IsMain = false,
					    Room =  room
					});
				}
			}
		   await _context.SaveChangesAsync();
		   return RedirectToAction("Index");
		}
		[HttpPost]
		public async Task<IActionResult> DeleteImage(int id,int rid)
		{
			var roomImage = await _context.RoomImages.FirstOrDefaultAsync(x => x.Id == id);
			var path = Path.Combine(_environment.WebRootPath, "assets", "img", "room", roomImage.Image);
			if (System.IO.File.Exists(path))
			{
				System.IO.File.Delete(path);
			}
			_context.RoomImages.Remove(roomImage);
			await _context.SaveChangesAsync();
			return RedirectToAction("Index","Room" ,new { id = rid});
		}
		public async Task<IActionResult> Delete(int id)
		{
			Room? exist = await _context.Rooms
                              .Include(x => x.RoomType).Include(x => x.Bookings).Include(x => x.RoomImages)
                              .FirstOrDefaultAsync(x => x.Id == id);
			if(exist == null) 
			{
                ModelState.AddModelError("", "Room is null");
                return View();
            }
            string path = Path.Combine(_environment.WebRootPath, "assets", "img", "room", exist.RoomImages.Where(x=>x.IsMain==true).FirstOrDefault().Image);
            if (System.IO.File.Exists(path))
            {
                System.IO.File.Delete(path);
            }
			foreach (var roomImage in exist.RoomImages.Where(x => x.IsMain == false))
			{
				string pat = Path.Combine(_environment.WebRootPath, "assets", "img", "room", roomImage.Image);
                if (System.IO.File.Exists(pat))
                {
                    System.IO.File.Delete(pat);
                }
            }
			exist.IsDeleted = true;
			await _context.SaveChangesAsync();
			return RedirectToAction("Index");
        }
	}
}
