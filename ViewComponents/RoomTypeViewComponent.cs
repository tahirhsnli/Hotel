using Hotel.DAL;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.ViewComponents
{
    public class RoomTypeViewComponent : ViewComponent
    {
        private readonly AppDbContext _context;

        public RoomTypeViewComponent(AppDbContext context)
        {
            _context = context;
        }
        
        public async Task<IViewComponentResult> InvokeAsync()
        {
            return View(await _context.RoomTypes.ToListAsync());
        }
    }
}
