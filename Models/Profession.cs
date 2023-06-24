using System.ComponentModel;

namespace Hotel.Models
{
	public class Profession : BaseEntity
	{
		public string Name { get; set; } = null!;
        public bool IsDeleted { get; set; }
        public List<Employee>? Employees { get; set; }
    }
}
