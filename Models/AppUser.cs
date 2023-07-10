﻿using Microsoft.AspNetCore.Identity;

namespace Hotel.Models
{
	public class AppUser : IdentityUser
	{
        public string Name { get; set; } = null!;
        public string Surname { get; set; } = null!;
        public List<Bookings>? Bookings { get; set; }
        public List<Comment>? Comments { get; set; }
    }
}
