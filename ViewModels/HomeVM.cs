using Hotel.Models;

namespace Hotel.ViewModels
{
    public class HomeVM
    {
        public List<RoomType>? RoomTypes { get; set; }
        public List<Slider>? Sliders { get; set; }
        public List<Facility>? Facilities { get; set; }
        public List<Services>? Services { get; set; }
    }
}
