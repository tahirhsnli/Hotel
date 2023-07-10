using Hotel.DAL;
using Hotel.Extension;
using Hotel.Models;
using Hotel.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace Hotel.Areas.HotelAdmin.Controllers
{
	[Area("HotelAdmin")]
	[Authorize(Roles = "admin")]
	public class ClientController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _env;

        public ClientController(AppDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _context.Clients.ToListAsync());
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(ClientVM clientVM)
        {
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError("", "Client is null");
                return View();
            }
            if (clientVM == null)
            {
                ModelState.AddModelError("", "Client is null");
                return View();
            }
            if (clientVM.ImageFile == null)
            {
                ModelState.AddModelError("ImageFile", "Image is null");
                return View();
            }
            if (clientVM.ImageFile.CheckSize(500))
            {
                ModelState.AddModelError("ImageFile", "Image size big");
                return View();
            }
            if (!clientVM.ImageFile.CheckFile("image"))
            {
                ModelState.AddModelError("ImageFile", "This is not Image");
                return View();
            }
            Client client = new Client();
            client.Image = await clientVM.ImageFile.SaveFile(_env.WebRootPath, "clients");
            await _context.Clients.AddAsync(client);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Edit(int id)
        {
            Client? exist = await _context.Clients.FirstOrDefaultAsync(x => x.Id == id);
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(ClientVM clientVM)
        {
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError("", "Client is null");
                return View();
            }
            Client? exist = await _context.Clients.FirstOrDefaultAsync(x => x.Id == clientVM.Id);
            if (exist == null)
            {
                ModelState.AddModelError("", "Client is null");
                return View();
            }
            if (clientVM.ImageFile != null)
            {
                if (clientVM.ImageFile.CheckSize(500))
                {
                    ModelState.AddModelError("ImageFile", "Image is big");
                    return View();
                }
                if (!clientVM.ImageFile.CheckFile("image"))
                {
                    ModelState.AddModelError("ImageFile", "Image is wrong type");
                    return View();
                }
                string path = Path.Combine(_env.WebRootPath, "assets", "img", "clients", exist.Image);
                if (System.IO.File.Exists(path))
                {
                    System.IO.File.Delete(path);
                }
                exist.Image = await clientVM.ImageFile.SaveFile(_env.WebRootPath, "clients");
            }
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Delete(int id)
        {
            Client? exist = await _context.Clients.FirstOrDefaultAsync(x => x.Id == id);
            if (exist == null)
            {
                ModelState.AddModelError("", "Client is null");
                return View();
            }
            _context.Clients.Remove(exist);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
    }
}
