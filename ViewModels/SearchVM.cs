using Hotel.Models;
using System.ComponentModel.DataAnnotations;

namespace Hotel.ViewModels
{
    public class SearchVM
    {
        public List<RoomType>? RoomTypes { get; set; }
        public decimal? Minprice { get; set; }
        [DisplayFormat(DataFormatString = "{0:M/d/yyy}", ApplyFormatInEditMode = true)]
        public DateTime StartDate { get; set; }
        [DisplayFormat(DataFormatString = "{0:M/d/yyy}", ApplyFormatInEditMode = true)]
        public DateTime EndDate { get; set; }
        public int ChildrenCapacity { get; set; }
        public int PeopleCapacity { get; set; }
        public decimal? Maxprice { get; set; }
        public int? RoomTypeId { get; set; }
    }
}
