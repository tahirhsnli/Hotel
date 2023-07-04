using Hotel.Models;

namespace Hotel.ViewModels
{
    public class FaqVM: BaseEntity
    {
        public string Question { get; set; } = null!;
        public string Answer { get; set; } = null!;
    }
}
