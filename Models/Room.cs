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
        public RoomType? RoomType { get; set; }
        public List<Bookings>? Bookings { get; set; }
        public List<RoomImage>? RoomImages { get; set; }
        public List<Comment>? Comments { get; set; }
        [NotMapped]
        public IFormFile? MainFile { get; set; }
        [NotMapped]
        public List<IFormFile>? Files{ get; set; }

    }
}
