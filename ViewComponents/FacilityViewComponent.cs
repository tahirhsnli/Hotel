using Hotel.DAL;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.ViewComponents
{
	public class FacilityViewComponent : ViewComponent
	{
		private readonly AppDbContext _context;

		public FacilityViewComponent(AppDbContext context)
		{
			_context = context;
		}

		public async Task<IViewComponentResult> InvokeAsync()
		{
			return View(await _context.Facilities.Where(x=>x.IsDeleted==false).ToListAsync());
		}
	}
}
