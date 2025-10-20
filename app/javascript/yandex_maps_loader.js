export function loadYandexMapsAPI(apiKey) {
    return new Promise((resolve, reject) => {
        if (window.ymaps) {
            // если уже загружено — просто резолвим
            resolve(window.ymaps);
            return;
        }

        const script = document.createElement('script');
        script.src = `https://api-maps.yandex.ru/2.1/?apikey=${apiKey}&lang=ru_RU`;
        // script.async = true;
        script.onload = () => {
            window.ymaps.load(() => {
                resolve(window.ymaps);
            });
        };
        script.onerror = () => reject(new Error('Failed to load Yandex Maps API'));
        document.head.appendChild(script);
    });
}