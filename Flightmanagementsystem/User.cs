﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Flightmanagementsystem
{
    class User : IPoco
    {
        public Int64 Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public Int32 User_Role { get; set; }

    }
}
