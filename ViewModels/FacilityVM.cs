using Hotel.Models;

namespace Hotel.ViewModels
{
    public class FacilityVM : BaseEntity
    {
        public string Title { get; set; } = null!;
        public string Description { get; set; } = null!;
        public string Icon { get; set; } = null!;
    }
}
