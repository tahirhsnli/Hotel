using System.ComponentModel.DataAnnotations;

namespace Hotel.ViewModels
{
	public class RegisterVM
	{
		public string Name { get; set; } = null!;
		public string Surname { get; set; } = null!;
		public string Username { get; set; } = null!;
		[DataType(DataType.EmailAddress)]
		public string EmailAddress { get; set; } = null!;
		[DataType(DataType.Password)]
		public string Password { get; set; } = null!;
		[DataType(DataType.Password), Compare(nameof(Password))]
		public string ConfirmPassword { get; set; } = null!;
	}
}
