using Hotel.DAL;
using Hotel.Models;
using Hotel.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.Controllers
{
    public class PagesController : Controller
    {
        private readonly AppDbContext _context;

        public PagesController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Services()
        {
            return View();
        }
        public IActionResult Facilities()
        {
            return View();
        }
        public IActionResult FAQ()
        {
            return View();
        }
        public IActionResult Team()
        {
            return View();
        }
        public async Task<IActionResult> Images(int page = 1,int take = 9)
        {
            var gallery = await _context.RoomImages.Include(x=>x.Room).Where(x=>x.IsMain != null).OrderByDescending(x=>x.Id).Skip((page - 1)*take).Take(take).ToListAsync();
            PaginateVM<RoomImage> paginate = new PaginateVM<RoomImage>()
            {
                Items = gallery,
                CurrentPage = page,
                PageCount = PageCount(take)
            };
            return View(paginate);
        }
        private int PageCount(int take)
        {
            var count = _context.RoomImages.Include(x => x.Room).Count(x => x.IsMain != null);
            return (int)Math.Ceiling((double)count / take);
        }
    }
}
