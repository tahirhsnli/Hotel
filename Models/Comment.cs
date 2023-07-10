namespace Hotel.Models
{
    public class Comment : BaseEntity
    {
        public string Description { get; set; } = null!;
        public DateTime Create { get; set; } = DateTime.Now;
        public AppUser? AppUser { get; set; }
        public string AppUserId { get; set; }
        public Room? Room { get; set; }
        public int RoomId { get; set; }
    }
}
