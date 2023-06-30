﻿using Hotel.DAL;
using Hotel.Models;
using Hotel.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace Hotel.Controllers
{
    public class RoomController : Controller
    {
        private readonly AppDbContext _context;

        public RoomController(AppDbContext context)
        {
            _context = context;
		}
		public IActionResult Index()
        {
			return View();
        }  

        public async Task<IActionResult> Search(SearchVM search)
        {
            decimal default_min_price = 0;
            decimal default_max_price = 100000000000;
            int room_type = 0;
            int childrenCapacity = 0;
			int peopleCapacity = 0;
            DateTime Start = DateTime.Today;
            DateTime End = DateTime.Today.AddDays(1);
            var startdate = search.StartDate;
            var rooms = await _context.Rooms
                                 .Include(x => x.RoomType).Include(x => x.Bookings).Include(x => x.RoomImages)
                                 .Where(x => x.IsDeleted == false).ToListAsync();
            if (search.StartDate < DateTime.Today)
            {
                ModelState.AddModelError("StartDate", "Wrong StartDate");
                return View(rooms);
            }
            if (search.EndDate < DateTime.Today.AddDays(1))
            {
                ModelState.AddModelError("StartDate", "Wrong EndDate");
                return View(rooms);
            }
            if (search.RoomTypeId != 0)
            {
                room_type = search.RoomTypeId;
            }
            if (search.Minprice != 0)
            {
                default_min_price = search.Minprice;

            }
            if (search.Maxprice != 0)
            {
                default_max_price = search.Maxprice;
            }
            if(search.ChildrenCapacity != 0)
            {
                childrenCapacity = search.ChildrenCapacity;
            }
            if (search.PeopleCapacity != 0)
            {
                peopleCapacity = search.PeopleCapacity;
            }
			var allrooms = await _context.Rooms
                                 .Include(x => x.RoomType).Include(x => x.Bookings).Include(x => x.RoomImages)
                                 .Where(x => x.IsDeleted == false && x.RoomPrice >= default_min_price &&
                                 x.RoomPrice <= default_max_price && x.ChildrenCapacity >= childrenCapacity &&
                                 x.PeopleCapacity >= peopleCapacity && (!(x.Bookings.FirstOrDefault().EndDate >= search.StartDate &&
                                 x.Bookings.FirstOrDefault().StartDate <= search.EndDate) || x.Bookings.FirstOrDefault().Id == null)).ToListAsync();
            var spesificRoomtypesPrices = await _context.Rooms
                              .Include(x => x.RoomType).Include(x => x.Bookings).Include(x => x.RoomImages)
                              .Where(x => x.IsDeleted == false && x.RoomPrice >= default_min_price &&
							  x.PeopleCapacity >= peopleCapacity && x.ChildrenCapacity >= childrenCapacity &&
							  x.RoomPrice <= default_max_price && x.RoomTypeId == room_type).ToListAsync();
            if(room_type == 0)
            {
                return View(allrooms);
            }
            return View(spesificRoomtypesPrices);
        }
    }
}
