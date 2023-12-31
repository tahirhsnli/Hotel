﻿using Hotel.DAL;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.ViewComponents
{
    public class TeamViewComponent : ViewComponent
    {
        private readonly AppDbContext _context;

        public TeamViewComponent(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            return View(await _context.Employees.Where(x=>x.IsDeleted==false).Include(x=>x.Profession).OrderByDescending(x=>x.Id).ToListAsync());
        }
    }
}
