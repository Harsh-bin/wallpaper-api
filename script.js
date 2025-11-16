(function() {
    const listUrl = 'random_media_list.json';

    fetch(listUrl)
        .then(response => {
            if (!response.ok) {
                throw new Error(`Network response was not ok: ${response.statusText}`);
            }
            return response.json();
        })
        .then(data => {
            const media = data.media;
            if (!media || media.length === 0) {
                console.error("media list is empty or not found.");
                return;
            }
            const randomIndex = Math.floor(Math.random() * media.length);
            const randomMediaFile = media[randomIndex];
            const media = `${randomMediaFile}`;
            window.location.replace(media);
        })
        .catch(error => {
            console.error('Failed to fetch or process media list:', error);
        });
})();