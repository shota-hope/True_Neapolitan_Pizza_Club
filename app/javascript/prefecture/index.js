// document.addEventListener('turbolinks:load', () => {
//     // Initialize and add the map
//   function initMap() {
//     // The location of Uluru
//     const uluru = { lat: -25.344, lng: 131.036 };
//     // The map, centered at Uluru
//     const map = new google.maps.Map(document.getElementById("map"), {
//       zoom: 4,
//       center: uluru,
//     });
//     // The marker, positioned at Uluru
//     const marker = new google.maps.Marker({
//       position: uluru,
//       map: map,
//     });
//   }
// })
// Initialize and add the map
window.addEventListener('load', function () {
    initMap();
})

function initMap() {
  // The location of Uluru
  const anpanman = { lat: 35.463, lng: 139.632 };
  // The map, centered at Uluru
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 6,
    center: anpanman,
  });
  // The marker, positioned at Uluru
  const marker = new google.maps.Marker({
    position: anpanman,
    map: map,
  });
  const infoWindow = new google.maps.InfoWindow({ // 吹き出しの追加
        content: '<div class="sample">アンパンマンミュージアム</div>' // 吹き出しに表示する内容
  });
 marker.addListener('click', function() { // マーカーをクリックしたとき
     infoWindow.open(map, marker); // 吹き出しの表示
    });
}

