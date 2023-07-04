using Hotel.Models;

namespace Hotel.ViewModels
{
    public class SpaSliderVM : BaseEntity
    {
        public IFormFile ImageFile { get; set; } = null!;
    }
}
