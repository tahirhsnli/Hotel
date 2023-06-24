using Hotel.DAL;
using Hotel.Extension;
using Hotel.Models;
using Hotel.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.Areas.HotelAdmin.Controllers
{
    [Area("HotelAdmin")]
    public class EmployeeController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _env;
        public EmployeeController(AppDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _context.Employees.Where(x=>x.IsDeleted==false).Include(x=>x.Profession).ToListAsync());
        }
        public async Task<IActionResult> Create()
        {
            ViewBag.Profession = await _context.Professions.ToListAsync();
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(EmployeeVM employeeVM)
        {
            ViewBag.Profession = await _context.Professions.ToListAsync();
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError("", "Employee is null");
                return View();
            }
            if(employeeVM == null)
            {
                ModelState.AddModelError("", "Employee is null");
                return View();
            }
            Employee employee = new Employee()
            {
                Name = employeeVM.Name,
                Surname = employeeVM.Surname,
                Phone = employeeVM.Phone,
                Age = employeeVM.Age,
                ProfessionId = employeeVM.ProfessionId
            };
            if(employeeVM.ImageFile == null) 
            {
                ModelState.AddModelError("ImageFile", "Image is null");
                return View();
            }
            if (!employeeVM.ImageFile.CheckFile("image"))
            {
                ModelState.AddModelError("ImageFile", "This is not Image");
                return View();
            }
            if (employeeVM.ImageFile.CheckSize(200))
            {
                ModelState.AddModelError("ImageFile", "Image size big");
                return View();
            }
            employee.Image = await employeeVM.ImageFile.SaveFile(_env.WebRootPath, "employee");
            await _context.Employees.AddAsync(employee);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Edit(int id)
        {
            ViewBag.Profession = await _context.Professions.ToListAsync();
            return View(await _context.Employees.Where(x=>x.IsDeleted==false).Include(x=>x.Profession).FirstOrDefaultAsync(x=>x.Id == id));
		}
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(EmployeeVM employeeVM)
        {
			ViewBag.Profession = await _context.Professions.ToListAsync();
			if (!ModelState.IsValid)
			{
				ModelState.AddModelError("", "Team is null");
				return View();
			}
			Employee? exist = await _context.Employees.Where(x => x.IsDeleted == false).Include(x => x.Profession).FirstOrDefaultAsync(x => x.Id == employeeVM.Id);
			if (exist == null)
			{
				ModelState.AddModelError("", "Employee is null");
				return View();
			}
			if (employeeVM.ImageFile != null)
			{
				if (employeeVM.ImageFile.CheckSize(200))
				{
					ModelState.AddModelError("ImageFile", "Image is big");
					return View();
				}
				if (!employeeVM.ImageFile.CheckFile("image"))
				{
					ModelState.AddModelError("ImageFile", "Image is wrong type");
					return View();
				}
				string path = Path.Combine(_env.WebRootPath, "assets", "img","employee", exist.Image);
				if (System.IO.File.Exists(path))
				{
					System.IO.File.Delete(path);
				}
				exist.Image = await employeeVM.ImageFile.SaveFile(_env.WebRootPath, "employee");
			}
            exist.Name = employeeVM.Name;
            exist.Surname = employeeVM.Surname;
            exist.Age = employeeVM.Age;
            exist.Phone = employeeVM.Phone;
            exist.ProfessionId = employeeVM.ProfessionId;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
		}
        public async Task<IActionResult> Delete(int id)
        {
			Employee? exist = await _context.Employees.Where(x => x.IsDeleted == false).Include(x => x.Profession).FirstOrDefaultAsync(x => x.Id == id);
			if (exist == null)
			{
				ModelState.AddModelError("", "Employee is null");
				return View();
			}
			string path = Path.Combine(_env.WebRootPath, "assets", "img", "employee", exist.Image);
			if (System.IO.File.Exists(path))
			{
				System.IO.File.Delete(path);
			}
			exist.IsDeleted = true;
			await _context.SaveChangesAsync();
			return RedirectToAction("Index");
		}
    }
}
