using Hotel.DAL;
using Hotel.Models;
using Hotel.ViewModels;
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
            var types = await _context.RoomTypes.OrderByDescending(x => x.Id).ToListAsync();
            return View(types);
        }
    }
}
