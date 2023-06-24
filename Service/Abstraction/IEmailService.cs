namespace Hotel.Service.Abstraction
{
	public interface IEmailService
	{
		public void SendEmail(string to, string subject, string body);
	}
}
