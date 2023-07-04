using Hotel.DAL;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.ViewComponents
{
    public class RestaurantViewComponent : ViewComponent
    {
        private readonly AppDbContext _context;

        public RestaurantViewComponent(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            return View(await _context.Restaurant.ToDictionaryAsync(x => x.Key, x => x.Value));
        }
    }
}
