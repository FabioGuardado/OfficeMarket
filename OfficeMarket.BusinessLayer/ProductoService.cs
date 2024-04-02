using Microsoft.EntityFrameworkCore;
using OfficeMarket.BusinessLayer.Interfaces;
using OfficeMarket.DataAccessLayer.Models;
using System.Collections;

namespace OfficeMarket.BusinessLayer
{
    public class ProductoService : IProductoService
    {
        public ModelContext _context;
        public ProductoService(ModelContext context)
        {
            _context = context;
        }

        public IList<Producto> GetAllProductos()
        {
            IList<Producto> productos = _context.Productos.ToList();

            return productos;
        }
    }
}
