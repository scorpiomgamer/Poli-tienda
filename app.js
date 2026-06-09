fetch('http://localhost:3000/api/data')
    .then(response => response.json())
    .then(data => {
        console.log(data);
        const dataContainer = document.getElementById('data-container');
        data.forEach(item => {
            const itemElement = document.createElement('div');

            itemElement.textContent = `ID: ${item.id}, Name: ${item.name}`; 
            dataContainer.appendChild(itemElement);
        }); 

    })
    .catch(error => {
        console.error('Error fetching data:', error);
    });

let publicacion = document.getElementById('container');
for (let i = 0; i <=5; i++) {
    publicacion.innerHTML += `<div class="publicacion">
    <h2>Publicacion ${i}</h2>
    <p>Contenido de la publicacion ${i}</p>
</div>`;
}
