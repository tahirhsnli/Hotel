using System.ComponentModel.DataAnnotations.Schema;

namespace Hotel.Models
{
    public class Room 
    {
        public int Id { get; set; }
        public int RoomNumber { get; set; }
        public decimal RoomPrice { get; set; }
        public int ChildrenCapacity { get; set; }
        public int PeopleCapacity { get; set; }
        public decimal Area { get; set; }
        public bool IsDeleted { get; set; }
        public bool IsExist { get; set; }
        public bool IsBalcony { get; set; }
        public bool IsAnimal { get; set; }
        public int RoomTypeId { get; set; }
        public RoomType RoomType { get; set; } = null!;
        public List<Bookings>? Bookings { get; set; }
        //public List<RoomImage>? Images { get; set; }
        //[NotMapped]
        //public IFormFile? PhotoFront { get; set; }
        //[NotMapped]
        //public IFormFile? PhotoBack { get; set; }
        //[NotMapped]
        //public List<RoomImage>? Files { get; set; }
        //public string? Img { get; set; }
        //[NotMapped]
        //public IFormFile ImageFile { get; set; } = null!;

    }
}
