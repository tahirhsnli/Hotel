using Hotel.DAL;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.ViewComponents
{
    public class AboutViewComponent : ViewComponent
    {
        private readonly AppDbContext _context;

        public AboutViewComponent(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            return View(await _context.Abouts.ToDictionaryAsync(x => x.Key, x => x.Value));
        }
    }
}
