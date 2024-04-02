using Microsoft.AspNetCore.Mvc;
using OfficeMarket.BusinessLayer;
using OfficeMarket.BusinessLayer.Interfaces;

namespace OfficeMarket.WebApp.Controllers
{
    public class ProductosController : Controller
    {
        public IProductoService _service { get; set; }

        public ProductosController(IProductoService service)
        {
            _service = service;
        }

        public IActionResult Index()
        {
            var productosResult = _service.GetAllProductos();
            ViewBag.productos = productosResult;
            return View();
        }
    }
}
