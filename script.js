document.addEventListener("DOMContentLoaded", function() {
  const imgElement = document.getElementById("random-image");

  fetch('img_list.json')
    .then(response => response.json())
    .then(data => {
      const images = data.images;
      const randomIndex = Math.floor(Math.random() * images.length);
      const randomImage = images[randomIndex];
      imgElement.src = `img/${randomImage}`;
    })
    .catch(error => console.error('Error fetching image list:', error));
});