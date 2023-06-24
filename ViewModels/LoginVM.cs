using System.ComponentModel.DataAnnotations;

namespace Hotel.ViewModels
{
	public class LoginVM
	{
		public string NameOrEmail { get; set; } = null!;
		[DataType(DataType.Password)]
		public string Password { get; set; } = null!;
    }
}
