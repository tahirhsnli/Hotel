namespace Hotel.Models
{
    public class Facility : BaseEntity
    {
        public string Title { get; set; } = null!;
        public string Description { get; set; } = null!;
        public string Icon { get; set; } = null!;
        public bool IsDeleted { get; set; }

    }
}
