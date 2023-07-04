using Hotel.DAL;
using Hotel.Models;
using Hotel.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.Areas.HotelAdmin.Controllers
{
    public class FaqController : Controller
    {
        private readonly AppDbContext _context;

        public FaqController(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _context.Faqs.Where(x=>x.IsDeleted).ToListAsync());
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(FaqVM faqVM)
        {
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError("", "Faq is null");
                return View();
            }
            if (faqVM == null)
            {
                ModelState.AddModelError("", "Faq is null");
                return View();
            }
            Faq faq = new Faq()
            {
                Question = faqVM.Question,
                Answer = faqVM.Answer,
            };
            await _context.Faqs.AddAsync(faq);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");          
        }
        public async Task<IActionResult> Edit(int id)
        {
            Faq? exist = await _context.Faqs.Where(x => x.IsDeleted == false).FirstOrDefaultAsync(x => x.Id == id);
            FaqVM faqVM = new FaqVM()
            {
                Question = exist.Question,
                Answer = exist.Answer,
            };
            return View(faqVM);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(FaqVM faq)
        {
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError("", "Faq is null");
                return View();
            }
            Faq? exist = await _context.Faqs.Where(x => x.IsDeleted == false).FirstOrDefaultAsync(x => x.Id == faq.Id);
            if (exist == null)
            {
                ModelState.AddModelError("", "Faq is null");
                return View();
            }
            exist.Question = faq.Question;
            exist.Answer = faq.Answer;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Delete(int id)
        {
            Faq? exist = await _context.Faqs.Where(x => x.IsDeleted == false).FirstOrDefaultAsync(x => x.Id == id);
            if (exist == null)
            {
                ModelState.AddModelError("", "Slider is null");
                return View();
            }
            exist.IsDeleted = true;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
    }
}
