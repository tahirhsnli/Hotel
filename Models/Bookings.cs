using System.ComponentModel.DataAnnotations;

namespace Hotel.Models
{
	public class Bookings
	{
		public int Id { get; set; }
		public int RoomId { get; set; }
		public Room Room { get; set; }
		[DisplayFormat(DataFormatString = "{0:d/M/yyy}", ApplyFormatInEditMode = true)]
		public DateTime StartDate { get; set; }
		[DisplayFormat(DataFormatString = "{0:d/M/yyy}", ApplyFormatInEditMode = true)]
		public DateTime EndDate { get; set; }
		public int ChildrenCount { get; set; }
		public int PeopleCount { get; set; }
		public bool IsPayed { get; set; }
		public bool IsActive { get; set; }
		public bool? Status { get; set; }
		public decimal TotalPrice { get; set; }
        public string? AppUserId { get; set; }
        public AppUser? AppUser { get; set; }
	}
}
