using Hotel.Models;

namespace Hotel.ViewModels
{
    public class EmployeeVM
    {
        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public string? Surname { get; set; }
        public int Age { get; set; }
        public int Phone { get; set; }
        public IFormFile? ImageFile{ get; set; }
        public int ProfessionId { get; set; }
        public Profession?  Profession { get; set; }
    }
}
