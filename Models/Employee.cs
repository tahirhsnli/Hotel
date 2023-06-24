using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace Hotel.Models
{
	public class Employee : BaseEntity
	{
        public string Name { get; set; } = null!;
        public string? Surname { get; set; }
        public int Age { get; set; }
        public int Phone { get; set; }
        public string Image { get; set; } = null!;
        [NotMapped]
        public IFormFile ImageFile { get; set; }
        public bool IsDeleted { get; set; }
        public int ProfessionId { get; set; }
        public Profession? Profession { get; set; }


    }
}
