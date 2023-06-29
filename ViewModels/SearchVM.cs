using Hotel.Models;

namespace Hotel.ViewModels
{
    public class SearchVM
    {
        public List<RoomType>? RoomTypes { get; set; }
        public decimal Minprice { get; set; }
        public decimal Maxprice { get; set; }
        public int RoomTypeId { get; set; }
    }
}
