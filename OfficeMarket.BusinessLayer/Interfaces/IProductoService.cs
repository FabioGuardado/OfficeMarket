using OfficeMarket.DataAccessLayer.Models;

namespace OfficeMarket.BusinessLayer.Interfaces
{
    public interface IProductoService
    {
        IList<Producto> GetAllProductos();
    }
}
