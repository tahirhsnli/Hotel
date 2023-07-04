using Hotel.DAL;
using Hotel.Models;
using Hotel.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace Hotel.Controllers
{
    public class RoomController : Controller
    {
        private readonly AppDbContext _context;

        public RoomController(AppDbContext context)
        {
            _context = context;
		}
		public async Task<IActionResult> Index(int page = 1, int take = 6)
        {
            ViewBag.RoomType = await _context.RoomTypes.ToListAsync();
            var rooms = await _context.Rooms.Where(x => x.IsDeleted == false).Skip((page - 1) * take).Take(take)
                              .Include(x => x.RoomType).Include(x => x.Bookings).Include(x => x.RoomImages)
                              .OrderByDescending(x => x.Id).ToListAsync();
            PaginateVM<Room> paginate = new PaginateVM<Room>()
            {
                Items = rooms,
                CurrentPage = page,
                PageCount = PageCount(take)
            };
            return View(paginate);
        }
        private int PageCount(int take)
        {
            var count = _context.Rooms.Count(x => x.IsDeleted == false);
            return (int)Math.Ceiling((double)count / take);
        }
        public async Task<IActionResult> Search(SearchVM search)
        {
            decimal? default_min_price = 0;
            decimal? default_max_price = 9999999999999;
            int? room_type = 0;
            int childrenCapacity = 0;
			int peopleCapacity = 0;
            var rooms = await _context.Rooms
                              .Include(x => x.RoomType).Include(x => x.Bookings).Include(x => x.RoomImages)
                              .Where(x => x.IsDeleted == false).ToListAsync();
            ViewBag.StartDate = search.StartDate;
            ViewBag.EndDate = search.EndDate;
            ViewBag.ChildrenCapacity = search.ChildrenCapacity;
            ViewBag.PeopleCapacity = search.PeopleCapacity;
            if (!ModelState.IsValid)
            {
                if(search.RoomTypeId != null)
                {
                    ModelState.AddModelError("", "The Search is null");
                    return View(rooms);
                }
            }
            if (search.StartDate <= DateTime.Today)
            {
                ModelState.AddModelError("StartDate", "The StartDate cannot be less than today");
                return View(rooms);
            }
            if (search.StartDate <= DateTime.Today.AddDays(1))
            {
                ModelState.AddModelError("EndDate","The EndDate cannot be less than tomorrow");
                return View(rooms);
            }
            if(search.PeopleCapacity <= 0)
            {
                ModelState.AddModelError("PeopleCapacity", "The PeopleCapacity cannot be 0 or negative");
                return View(rooms);
            }
            if (search.ChildrenCapacity <= 0)
            {
                ModelState.AddModelError("ChildrenCapacity", "The ChildrenCapacity cannot be 0 or negative");
                return View(rooms);
            }
            if(search.Maxprice <= 0 ) 
            {
                ModelState.AddModelError("MaxPrice", "The MaxPrice cannot be 0 or negative");
                return View(rooms);
            }
            if(search.Minprice <= 0 )
            {
                ModelState.AddModelError("MaxPrice", "The MinPrice cannot be 0 or negative");
                return View(rooms);
            }
            if(search.Maxprice <= search.Minprice)
            {
                ModelState.AddModelError("", "Max price cannot be less than Min price");
                return View(rooms);
            }
            if(search.StartDate >= search.EndDate)
            {
                ModelState.AddModelError("", "The start date cannot be greater than the end date");
                return View(rooms);
            }
            if (search.RoomTypeId != 0)
            {
                room_type = search.RoomTypeId;
            }
            if (search.Minprice != 0)
            {
                default_min_price = search.Minprice;

            }
            if (search.Maxprice != 0)
            {
                default_max_price = search.Maxprice;
            }
            if(search.ChildrenCapacity != 0)
            {
                childrenCapacity = search.ChildrenCapacity;
            }
            if (search.PeopleCapacity != 0)
            {
                peopleCapacity = search.PeopleCapacity;
            }

            var allrooms = await _context.Rooms.Include(x => x.RoomType).Include(x => x.Bookings).Include(x => x.RoomImages).
                Where(x => x.IsDeleted == false && x.RoomPrice >= default_min_price &&
                                 x.RoomPrice <= default_max_price && x.ChildrenCapacity >= childrenCapacity && x.PeopleCapacity >= peopleCapacity &&
                                 x.Bookings.All(m=>!(m.EndDate >= search.StartDate && m.StartDate <= search.EndDate)) || x.Bookings == null).OrderByDescending(x => x.Id).ToListAsync();
            var spesificRoomtypesPrices = await _context.Rooms
                              .Include(x => x.RoomType).Include(x => x.Bookings).Include(x => x.RoomImages)
                              .Where(x => x.IsDeleted == false && x.RoomPrice >= default_min_price &&
							  x.PeopleCapacity >= peopleCapacity && x.ChildrenCapacity >= childrenCapacity &&
							  x.RoomPrice <= default_max_price && x.RoomTypeId == room_type && x.Bookings.All(m => !(m.EndDate >= search.StartDate && m.StartDate <= search.EndDate)) || x.Bookings == null).OrderByDescending(x => x.Id).ToListAsync();
            if(room_type == null)
            {
                return View(allrooms);
            }
            return View(spesificRoomtypesPrices);
        }
        public async Task<IActionResult> Details(int id)
        {
            var rooms = await _context.Rooms
                              .Include(x => x.RoomType).Include(x => x.Bookings).Include(x => x.RoomImages)
                              .FirstOrDefaultAsync(x => x.Id == id);
            return View(rooms);
        }
    }
}
