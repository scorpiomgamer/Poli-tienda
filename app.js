const API_URL = 'http://localhost:3000/api/productos';

function obtenerImagen(item) {
    if (item.ImagenUrl) {
        return item.ImagenUrl;
    }

    const texto = (item.Nombre + ' ' + (item.Descripcion || '')).toLowerCase();

    if (texto.includes('disfraz')) {
        return 'https://images.unsplash.com/photo-1574158622682-e40e69881006?w=400';
    }
    if (texto.includes('camiseta')) {
        return 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=400';
    }
    if (texto.includes('abrigo') || texto.includes('chaqueta')) {
        return 'https://images.unsplash.com/photo-1545249390-6bdfa286032f?w=400';
    }
    if (texto.includes('pijama')) {
        return 'https://images.unsplash.com/photo-1513245543132-31f507417b26?w=400';
    }
    if (texto.includes('sombrero') || texto.includes('pañuelo') || texto.includes('corbatin')) {
        return 'https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?w=400';
    }

    return 'https://via.placeholder.com/200?text=Producto';
}

fetch(API_URL)
    .then(response => response.json())
    .then(response => {
        const productos = response.data || [];
        const dataContainer = document.getElementById('data-container');

        if (!dataContainer) {
            return;
        }

        dataContainer.innerHTML = '';

        if (productos.length === 0) {
            dataContainer.innerHTML = '<p class="mensaje-vacio">No hay productos disponibles.</p>';
            return;
        }

        productos.forEach(item => {
            const imagen = obtenerImagen(item);
            const itemElement = document.createElement('div');
            itemElement.className = 'producto';

            itemElement.innerHTML = `
                <img src="${imagen}" alt="${item.Nombre}" class="producto-img">
                <h2>${item.Nombre}</h2>
                <p class="categoria">${item.Categoria || 'Sin categoria'}</p>
                <p>${item.Descripcion || 'Sin descripcion'}</p>
                <p class="precio">Precio: $${Number(item.Precio).toFixed(2)}</p>
                <p class="stock">Stock: ${item.Stock}</p>
                <button type="button">Anadir al Carrito</button>
            `;
            dataContainer.appendChild(itemElement);
        });
    })
    .catch(error => {
        console.error('Error fetching data:', error);
        const dataContainer = document.getElementById('data-container');
        if (dataContainer) {
            dataContainer.innerHTML = '<p class="mensaje-error">Error al cargar productos. Verifica que el servidor este activo.</p>';
        }
    });
