document.addEventListener("turbo:load", function() {
    if (typeof ymaps === "undefined") return;

    ymaps.ready(init);
    function init() {
        const mapEL = document.getElementById("yandex-map").dataset.motel;
        var motel = mapEL.replace(/'\'/g, "").replace(/=>/g, ":");
        motel = JSON.parse(motel);
        debugger
        const map = new ymaps.Map("yandex-map", {
            center: [ motel.latitude,  motel.longitude], // временно Москва
            zoom: 5,
            controls: ["zoomControl"]
        });
        // Загружаем координаты конкретного объекта
        // fetch(`<%= point_motel_path(id: ${motel.id}) %>`)
        //     .then(response => response.json())
        //     .then(place => {
                const coords = [motel.latitude, motel.longitude];
                const placemark = new ymaps.Placemark(
                    coords,
                    { balloonContent: `<strong>${motel.name}</strong>` },
                    { preset: "islands#redIcon" }
                );

                map.geoObjects.add(placemark);
                map.setCenter(coords, 12);
            // });
    }
});
