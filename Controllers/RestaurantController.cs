using Hotel.DAL;
using Hotel.Models;
using Microsoft.AspNetCore.Mvc;
using System.Drawing.Text;

namespace Hotel.Controllers
{
	public class RestaurantController : Controller
	{
		private readonly AppDbContext _context;

        public RestaurantController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
		{
			
			RestaurantViewModel viewModel = new RestaurantViewModel()
			{
				Sliders = _context.RestaurantSliders.ToList(),
			};
			return View(viewModel);
		}
	}
}
