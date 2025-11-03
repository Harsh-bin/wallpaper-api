(function() {
    const listUrl = 'img_list.json';

    fetch(listUrl)
        .then(response => {
            if (!response.ok) {
                throw new Error(`Network response was not ok: ${response.statusText}`);
            }
            return response.json();
        })
        .then(data => {
            const images = data.images;
            if (!images || images.length === 0) {
                console.error("Image list is empty or not found.");
                return;
            }
            const randomIndex = Math.floor(Math.random() * images.length);
            const randomImageFile = images[randomIndex];
            const imageUrl = `img/${randomImageFile}`;
            window.location.replace(imageUrl);
        })
        .catch(error => {
            console.error('Failed to fetch or process image list:', error);
        });
})();