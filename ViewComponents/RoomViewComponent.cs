using Hotel.DAL;
using Hotel.Models;
using Hotel.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.ViewComponents
{
    public class RoomViewComponent : ViewComponent
    {
        private readonly AppDbContext _context;

        public RoomViewComponent(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IViewComponentResult> InvokeAsync(int page = 1,int take = 3)
        {
            ViewBag.RoomType = await _context.RoomTypes.ToListAsync();
            var rooms = await _context.Rooms.Where(x => x.IsDeleted == false).Skip((page - 1)*take).Take(take)
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
    }
}
