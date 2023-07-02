using Hotel.DAL;
using Hotel.Models;
using Hotel.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.Controllers
{
    public class OrderController : Controller
    {
        private readonly AppDbContext _context;
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;

        public OrderController(AppDbContext context, UserManager<AppUser> userManager, SignInManager<AppUser> signInManager)
        {
            _context = context;
            _userManager = userManager;
            _signInManager = signInManager;
        }
        public IActionResult Checkout(DateTime start, DateTime end)
        {
            OrderVM orderVM = new OrderVM()
            {
                StartDate = start,
                EndDate = end
            };
            return View(orderVM);
        }
        [HttpPost]
        public async Task<IActionResult> Checkout(OrderVM orderVM,int id)
        {
            AppUser user = await _userManager.FindByNameAsync(User.Identity.Name);
            var rooms = _context.Rooms.FirstOrDefault(r => r.Id == id);
            DateTime? date = ViewBag.StartDate;
            Bookings bookings = new Bookings()
            {
                Status = false,
                AppUser = user,
                ChildrenCount = orderVM.ChildrenCount,
                PeopleCount = orderVM.PeopleCount,
                RoomId = id
            };
            await _context.Bookings.AddAsync(bookings);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index", "Home");
        }
    }
}
