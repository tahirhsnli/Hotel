using Hotel.DAL;
using Hotel.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.ViewComponents
{
    public class SearchViewComponent : ViewComponent
    {
        private readonly AppDbContext _context;

        public SearchViewComponent(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            SearchVM searchVM = new SearchVM();
            searchVM.RoomTypes = await _context.RoomTypes.ToListAsync();
            return View(searchVM);
        }
    }
}
