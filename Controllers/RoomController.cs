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
		public async Task<IActionResult> Index(int page = 1, int take = 3)
        {
            ViewBag.RoomType = await _context.RoomTypes.ToListAsync();
            var rooms = await _context.Rooms.Where(x => x.IsDeleted == false).Skip((page - 1) * take).Take(take)
                              .Include(x => x.RoomType).Include(x => x.Bookings).Include(x => x.RoomImages)
                              .ToListAsync();
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
            decimal default_min_price = 0;
            decimal default_max_price = 100000000000;
            int room_type = 0;
            int childrenCapacity = 0;
			int peopleCapacity = 0;
            var rooms = await _context.Rooms
                                 .Include(x => x.RoomType).Include(x => x.Bookings).Include(x => x.RoomImages)
                                 .Where(x => x.IsDeleted == false).ToListAsync();
            ViewBag.StartDate = search.StartDate;
            ViewBag.EndDate = search.EndDate;
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
			var allrooms = await _context.Rooms
                                 .Include(x => x.RoomType).Include(x => x.Bookings).Include(x => x.RoomImages)
                                 .Where(x => x.IsDeleted == false && x.RoomPrice >= default_min_price &&
                                 x.RoomPrice <= default_max_price && x.ChildrenCapacity >= childrenCapacity && (!(x.Bookings.FirstOrDefault().EndDate >= search.StartDate &&
                                 x.Bookings.FirstOrDefault().StartDate <= search.EndDate) || x.Bookings.FirstOrDefault().Id == null) &&
                                 x.PeopleCapacity >= peopleCapacity).ToListAsync();

            var aa = await _context.Rooms.Include(x => x.RoomType).Include(x => x.Bookings).Include(x => x.RoomImages).
                Where(x => x.IsDeleted == false && x.RoomPrice >= default_min_price &&
                                 x.RoomPrice <= default_max_price && x.ChildrenCapacity >= childrenCapacity &&
                                 x.Bookings.All(m=>!(m.EndDate >= search.StartDate && m.StartDate <= search.EndDate)) || x.Bookings == null).ToListAsync();
            
            var spesificRoomtypesPrices = await _context.Rooms
                              .Include(x => x.RoomType).Include(x => x.Bookings).Include(x => x.RoomImages)
                              .Where(x => x.IsDeleted == false && x.RoomPrice >= default_min_price &&
							  x.PeopleCapacity >= peopleCapacity && x.ChildrenCapacity >= childrenCapacity &&
							  x.RoomPrice <= default_max_price && x.RoomTypeId == room_type).ToListAsync();
            if(room_type == 0)
            {
                return View(aa);
            }
            return View(spesificRoomtypesPrices);
        }
    }
}
