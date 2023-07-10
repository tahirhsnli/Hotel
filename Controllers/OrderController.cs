using Hotel.DAL;
using Hotel.Models;
using Hotel.ViewModels;
using Microsoft.AspNetCore.Authorization;
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
        [Authorize]
        public IActionResult Checkout(int id,DateTime start, DateTime end,int childrencount,int peoplecount)
        {
            var rooms = _context.Rooms.FirstOrDefault(r => r.Id == id);
            if (start > DateTime.Today && end > DateTime.Today.AddDays(1))
            {
                ViewBag.Startdates = start;
                ViewBag.Enddates = end;
            }
            ViewBag.ChildrenCount = childrencount;
            ViewBag.PeopleCount = peoplecount;
            OrderVM orderVM = new OrderVM()
            {
                StartDate = start,
                EndDate = end,
                ChildrenCount = childrencount,
                PeopleCount = peoplecount,
                Totalprice = (((end.Year - start.Year) * 365) + ((end.Month - start.Month) * 30) + ((end.Day - start.Day))) *rooms.RoomPrice,
            };
            return View(orderVM);
        }
        [HttpPost]
        public async Task<IActionResult> Checkout(int id,DateTime StartTime,DateTime EndTime,int Children,int People,OrderVM order)
        {
            AppUser user = await _userManager.FindByNameAsync(User.Identity.Name);
            var rooms = _context.Rooms.FirstOrDefault(r => r.Id == id);
            Bookings bookings = new Bookings()
            {
                Status = null,
                AppUser = user,
                ChildrenCount = Children,
                StartDate = StartTime,
                EndDate = EndTime,
                PeopleCount = People,
                RoomId = id,
                TotalPrice = (int)(EndTime.Day - StartTime.Day) * rooms.RoomPrice
            };
            await _context.Bookings.AddAsync(bookings);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index", "Home");
        }
    }
}
