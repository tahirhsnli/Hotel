using System.ComponentModel.DataAnnotations.Schema;

namespace Hotel.Models
{
    public class RoomImage 
    {
        public int Id { get; set; }
        public string? Image { get; set; }
        [NotMapped]
        public IFormFile ImageFile { get; set; } = null!;
        public bool IsMain { get; set; }
        public int RoomId { get; set; }
        public Room? Room { get; set; }
    }
}
