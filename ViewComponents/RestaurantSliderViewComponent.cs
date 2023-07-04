using Hotel.DAL;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.ViewComponents
{
	public class RestaurantSliderViewComponent : ViewComponent
	{
		private readonly AppDbContext _context;

		public RestaurantSliderViewComponent(AppDbContext context)
		{
			_context = context;
		}
		public async Task<IViewComponentResult> InvokeAsync()
		{
			return View(await _context.RestaurantSliders.OrderByDescending(x => x.Id).ToListAsync());
		}
	}
}
