﻿using Hotel.DAL;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.ViewComponents
{
    public class GalleryHeaderViewComponent : ViewComponent
    {
        private readonly AppDbContext _context;

        public GalleryHeaderViewComponent(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            return View(await _context.HeaderSections.ToDictionaryAsync(x=>x.Key,x=>x.Value));
        }
    }
}
