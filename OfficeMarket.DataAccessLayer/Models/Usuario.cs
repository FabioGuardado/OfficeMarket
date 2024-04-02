using System;
using System.Collections.Generic;

namespace OfficeMarket.DataAccessLayer.Models
{
    public partial class Usuario
    {
        public decimal Id { get; set; }
        public string? Email { get; set; }
        public string? Password { get; set; }
        public DateTime? UltimaConexion { get; set; }
    }
}
