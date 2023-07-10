using Hotel.Models;

namespace Hotel.ViewModels
{
    public class CommentVM 
    {
        public string Description { get; set; } = null!;
        public DateTime? Create { get; set; }
        public string? AppUserId { get; set; }
        public int RoomId { get; set; }
        public List<Comment>? Comments { get; set; }
        public Room? Room { get; set; }
    }
}
