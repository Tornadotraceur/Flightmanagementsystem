﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Flightmanagementsystem
{
    class Country : IPoco  , IUser
    {
        public Int64 Id { get; set; }
        public string Name { get; set; }

    }
}
