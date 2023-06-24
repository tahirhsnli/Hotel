using Hotel.Service.Abstraction;
using System.Net.Mail;
using System.Net;

namespace Hotel.Service.Concrate
{
	public class EmailManager : IEmailService
	{
		private readonly IConfiguration _configuration;

		public EmailManager(IConfiguration configuration)
		{
			_configuration = configuration;
		}

		public void SendEmail(string to, string subject, string body)
		{
			SmtpClient smtp = new SmtpClient("smtp.gmail.com")
			{
				Port = 587,
				EnableSsl = true,
				Credentials = new NetworkCredential(_configuration["EmailSettings:Email"], _configuration["EmailSettings:Password"])
			};
			MailMessage mail = new MailMessage(_configuration["EmailSettings:Email"], to, subject, body);
			mail.IsBodyHtml = true;
			smtp.Send(mail);
		}
	}
}
