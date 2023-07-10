using Hotel.Models;

namespace Hotel.ViewModels
{
    public class ClientVM : BaseEntity
    {
        public IFormFile ImageFile { get; set; } = null!;
    }
}
