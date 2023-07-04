using Hotel.DAL;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.ViewComponents
{
    public class FaqViewComponent : ViewComponent
    {
        private readonly AppDbContext _context;

        public FaqViewComponent(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            return View(await _context.Faqs.Where(x=>x.IsDeleted==false).ToListAsync());
        }
    }
}
