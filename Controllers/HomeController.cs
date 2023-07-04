using Hotel.DAL;
using Hotel.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.Controllers
{
    public class HomeController : Controller
    {
        private readonly AppDbContext _appDbContext;

        public HomeController(AppDbContext appDbContext)
        {
            _appDbContext = appDbContext;
        }

        public IActionResult Index()
        {
            HomeVM home = new HomeVM()
            {
                Sliders = _appDbContext.Sliders.Where(x=>x.IsDeleted==false).ToList(),
                RoomTypes = _appDbContext.RoomTypes.ToList(),
                Facilities = _appDbContext.Facilities.Where(x=>x.IsDeleted == false).ToList(),
                Services = _appDbContext.Services.ToList()
            };
            return View(home);
        }
    }
}
