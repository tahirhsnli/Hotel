using Hotel.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Hotel.DAL
{
    public class AppDbContext : IdentityDbContext<AppUser>
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
            
        }
        public DbSet<Setting> Settings { get; set; }
        public DbSet<Profession> Professions { get; set; }
        public DbSet<Employee> Employees { get; set; }
        public DbSet<RoomType> RoomTypes { get; set; }
        public DbSet<Room> Rooms { get; set; }
        public DbSet<RoomImage> RoomImages { get; set; }
        public DbSet<Bookings> Bookings { get; set; }
        public DbSet<Slider> Sliders { get; set; }
        public DbSet<Facility> Facilities { get; set; }
        public DbSet<About> Abouts { get; set; }
        public DbSet<RestaurantSlider> RestaurantSliders { get; set;}
        public DbSet<Restaurant> Restaurant { get; set; }
        public DbSet<Spa> Spa { get; set; }
        public DbSet<SpaSlider> SpaSliders { get; set; }
        public DbSet<Services> Services { get; set; }
        public DbSet<Faq> Faqs { get; set; }
    }
}
