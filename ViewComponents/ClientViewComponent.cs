using Hotel.DAL;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.ViewComponents
{
	public class ClientViewComponent : ViewComponent
	{
		private readonly AppDbContext _context;

		public ClientViewComponent(AppDbContext context)
		{
			_context = context;
		}

		public async Task<IViewComponentResult> InvokeAsync()
		{
			return View(await _context.Clients.ToListAsync());
		}
	}
}
