namespace Hotel.Models
{
	public class Slider : BaseEntity
	{
		public string Title { get; set; } = null!;
		public string Description { get; set; } = null!;
        public bool IsDeleted { get; set; }
        public string Image { get; set; } = null!;
    }
}
