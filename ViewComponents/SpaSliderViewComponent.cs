using Hotel.DAL;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ViewEngines;
using Microsoft.EntityFrameworkCore;

namespace Hotel.ViewComponents
{
	public class SpaSliderViewComponent : ViewComponent
	{
		private readonly AppDbContext _context;

		public SpaSliderViewComponent(AppDbContext context)
		{
			_context = context;
		}

		public async Task<IViewComponentResult> InvokeAsync()
		{
			return View(await _context.SpaSliders.OrderByDescending(x => x.Id).ToListAsync());
		}
	}
}
