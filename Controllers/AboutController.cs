using Hotel.DAL;
using Hotel.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.Controllers
{
    public class AboutController : Controller
    {
        private readonly AppDbContext _context;

        public AboutController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            AboutViewModel about = new AboutViewModel()
            {
                Facilities = _context.Facilities.Where(x=>x.IsDeleted).ToList(),
                Employees = _context.Employees.Where(x=>x.IsDeleted == false).ToList(),
            };
            return View(about);
        }
    }
}
