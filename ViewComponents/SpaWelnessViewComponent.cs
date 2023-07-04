using Hotel.DAL;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.ViewComponents
{
    public class SpaWelnessViewComponent : ViewComponent
    {
        private readonly AppDbContext _context;

        public SpaWelnessViewComponent(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            return View(await _context.Spa.ToDictionaryAsync(x => x.Key, x => x.Value));
        }
    }
}
