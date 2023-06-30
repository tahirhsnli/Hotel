using Hotel.Models;
using Hotel.Service.Abstraction;
using Hotel.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace Hotel.Controllers
{
	public class AccountController : Controller
	{
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly IEmailService _emailService;

        public AccountController(UserManager<AppUser> userManager, SignInManager<AppUser> signInManager, RoleManager<IdentityRole> roleManager, IEmailService emailService)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _roleManager = roleManager;
            _emailService = emailService;
        }

        public IActionResult Register()
		{
			return View();
		}
        [HttpPost]
        [ValidateAntiForgeryToken]
		public async Task<IActionResult> Register(RegisterVM register)
		{
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError("", "User is null");
                return View();
            }
            AppUser user = new AppUser()
            {
                Name = register.Name,
                Surname = register.Surname,
                UserName = register.Username,
                Email = register.EmailAddress
            };
            IdentityResult result = await _userManager.CreateAsync(user, register.Password);
            if (!result.Succeeded)
            {
                foreach (var item in result.Errors)
                {
                    ModelState.AddModelError("", item.Description);
                }
                return View();
            }
            var token = await _userManager.GenerateEmailConfirmationTokenAsync(user);
            var url = Url.Action("ConfirmEmail", "Account", new { UserId = user.Id, token = token }, Request.Scheme);
            _emailService.SendEmail(user.Email, "Confirmation Email", @$"<a href={url}>Verify Email</a>");
            return RedirectToAction("Index", "Home");
        }
        public async Task<IActionResult> ConfirmEmail(string UserId, string token)
        {
            var user = await _userManager.FindByIdAsync(UserId);
            if (user == null)
            {
                ModelState.AddModelError("", "User is null");
                return View();
            }
            var confirm = await _userManager.ConfirmEmailAsync(user, token);
            if (confirm.Succeeded)
            {
                await _signInManager.SignInAsync(user, false);
				return RedirectToAction("Index", "Home");
            }
            return View();
        }
        public IActionResult Login()
		{
			return View();
		}
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(LoginVM login)
        {
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError("", "User is null");
                return View();
            }
            if (login.NameOrEmail.Contains("@"))
            {
                var user = await _userManager.FindByEmailAsync(login.NameOrEmail);
                if (user != null)
                {
                    var result = await _signInManager.PasswordSignInAsync(user, login.Password, false, false);
                    if (!result.Succeeded)
                    {
                        ModelState.AddModelError("", "User is null");
                        return View();
                    }
                    await _userManager.AddToRoleAsync(user, "admin");
                    return RedirectToAction("Index", "Home");
                }
            }
            else
            {
                var user = await _userManager.FindByNameAsync(login.NameOrEmail);
                if (user != null)
                {
                    var result = await _signInManager.PasswordSignInAsync(user, login.Password, false, false);
                    if (!result.Succeeded)
                    {
                        ModelState.AddModelError("", "User is null");
                        return View();
                    }
					return RedirectToAction("Index", "Home");
                }
            }
            return View();
        }
		public async Task<IActionResult> LogOut()
		{
			await _signInManager.SignOutAsync();
			return RedirectToAction("Index", "Home");
		}
		public async Task<IActionResult> AddRole()
		{
			await _roleManager.CreateAsync(new IdentityRole { Name = "admin" });
			return NoContent();
		}
	}
}
