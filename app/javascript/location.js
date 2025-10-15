import { loadYandexMapsAPI } from './yandex_maps_loader.js';


// console.log('DOMContentLoaded — ищем #map', document.getElementById('map'));
document.addEventListener('turbo:load', () => {
    const mapContainer = document.getElementById('map');
    if (!mapContainer) {
        // throw new Error('Контейнер для карты не найден');
        console.log('Контейнер для карты не найден');
        alert('Контейнер для карты не найден');
    };

    loadYandexMapsAPI('334c8aeb-9225-4daa-864f-2ef6abce925e')
        .then(ymaps => {
            const map = new ymaps.Map('map', {
                center: [53.9408, 27.6400],
                zoom: 10
            });

            var placemark;

            const latitude = document.getElementById('motel_latitude')
            const longitude = document.getElementById('motel_longitude')

            // Обработчик клика по карте
            map.events.add('click', function (e) {
                var coords = e.get('coords');

                // Убираем старый маркер
                if (placemark) {
                    map.geoObjects.remove(placemark);
                }
                latitude.value = coords[0];
                longitude.value = coords[1];
                // Добавляем новый маркер
                placemark = new ymaps.Placemark(coords);
                map.geoObjects.add(placemark);



                console.log('Координаты:', coords);

                // Отправка на сервер через fetch
                // fetch('/motels', {
                //     method: 'POST',
                //     headers: {
                //         'Content-Type': 'application/json',
                //         'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
                //     },
                //     body: JSON.stringify({
                //         place: {
                //             latitude: coords[0],
                //             longitude: coords[1],
                //             name: 'Точка на Яндекс.Карте'
                //         }
                //     })
                // }).then(response => {
                //     if (response.ok) {
                //         alert('Координаты сохранены!');
                //     } else {
                //         alert('Ошибка при сохранении');
                //     }
            });

        })
        .catch(error => {
            console.error(error);
        });
});