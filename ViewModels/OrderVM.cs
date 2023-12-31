﻿using System.ComponentModel.DataAnnotations;

namespace Hotel.ViewModels;

public class OrderVM
{
    [DisplayFormat(DataFormatString = "{0:M/d/yyy}", ApplyFormatInEditMode = true)]
    public DateTime StartDate { get; set; }
    [DisplayFormat(DataFormatString = "{0:M/d/yyy}", ApplyFormatInEditMode = true)]
    public DateTime EndDate { get; set; }
    public int ChildrenCount{ get; set; }
    public int PeopleCount { get; set; }
    public decimal Totalprice { get; set; }

}
