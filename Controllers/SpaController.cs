using Hotel.DAL;
using Hotel.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace Hotel.Controllers
{
    public class SpaController : Controller
    {
        private readonly AppDbContext _context;

        public SpaController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            SpaViewModel spa = new SpaViewModel()
            {
                SpaSliders = _context.SpaSliders.ToList(),
                Services = _context.Services.ToList(),
            };
            return View(spa);
        }
    }
}
