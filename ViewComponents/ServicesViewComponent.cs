using Hotel.DAL;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.ViewComponents
{
    public class ServicesViewComponent : ViewComponent
    {
        private readonly AppDbContext _context;

        public ServicesViewComponent(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            return View(await _context.Services.ToDictionaryAsync(x => x.Key, x => x.Value));
        }
    }
}
