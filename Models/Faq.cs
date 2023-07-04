namespace Hotel.Models
{
    public class Faq : BaseEntity
    {
        public string Question { get; set; } = null!;
        public string Answer { get; set; } = null!;
        public bool IsDeleted { get; set; }
    }
}
