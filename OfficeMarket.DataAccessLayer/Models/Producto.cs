using System;
using System.Collections.Generic;

namespace OfficeMarket.DataAccessLayer.Models
{
    public partial class Producto
    {
        public decimal Id { get; set; }
        public string? Nombre { get; set; }
        public decimal? Precio { get; set; }
        public decimal? Stock { get; set; }
        public string? Imagen { get; set; }
        public decimal? CategoriaId { get; set; }

        public virtual Categoria? Categoria { get; set; }
    }
}
