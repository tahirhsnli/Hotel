using Hotel.DAL;
using Hotel.ViewModels;
using Microsoft.AspNetCore.Mvc;
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

        public IActionResult Index()
        {
            return View();
        }  

        public async Task<IActionResult> Search(SearchVM search)
        {
            decimal default_min_price = 0;
            decimal default_max_price = 100000000000;
            int room_type = 0;
            DateTime Start = DateTime.Now;
            DateTime End = new DateTime(2025,11,30);
            if(search.RoomTypeId != 0)
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
            var allrooms = await _context.Rooms
                              .Include(x => x.RoomType).Include(x => x.Bookings).Include(x => x.RoomImages)
                              .Where(x => x.IsDeleted == false && x.RoomPrice >= default_min_price &&
                              x.RoomPrice <= default_max_price).ToListAsync();

           var spesificRoomtypesPrices = await _context.Rooms
                              .Include(x => x.RoomType).Include(x => x.Bookings).Include(x => x.RoomImages)
                              .Where(x => x.IsDeleted == false && x.RoomPrice >= default_min_price &&
                              x.RoomPrice <= default_max_price && x.RoomTypeId == room_type).ToListAsync();
            if(room_type == 0)
            {
                return View(allrooms);
            }
            return View(spesificRoomtypesPrices);
        }
    }
}
