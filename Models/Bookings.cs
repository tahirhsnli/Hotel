namespace Hotel.Models
{
	public class Bookings
	{
		public int Id { get; set; }
		public int RoomId { get; set; }
		public Room? Room { get; set; }
		public DateTime StartDate { get; set; }
		public DateTime EndDate { get; set; }
		public int ChildrenCount { get; set; }
		public int PeopleCount { get; set; }
		public bool IsPayed { get; set; }
		public bool IsActive { get; set; }
	}
}
