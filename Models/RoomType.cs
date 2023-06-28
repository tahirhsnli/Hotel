namespace Hotel.Models
{
    public class RoomType 
    {
        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public string? Image { get; set; }
        public bool IsDeleted { get; set; }
        public List<Room>? Rooms { get; set; }

    }
}