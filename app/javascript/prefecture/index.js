// Initialize and add the map

window.addEventListener("load", () => {
  if (typeof gon !== "undefined") {
    initMap();
  }
});

const marker = [];
const infoWindow = [];

function initMap() {
  const center_of_map = {
    lat: parseFloat(gon.center_of_map_lat),
    lng: parseFloat(gon.center_of_map_lng),
  };
  const zoom_level_of_map = gon.zoom_level_of_map;

  // 地図の作成、中心位置の設定
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: zoom_level_of_map,
    center: center_of_map,
  });

  const shops_on_map = gon.shops_on_map;
  // 各shopデータを格納する箱 obj
  let shopsData = {};
  // shopデータを格納するオブジェクト markerData
  let markerData = [];

  // markerDataにshopデータをループ処理で格納
  for (let i = 0; i < shops_on_map.length; i++) {
    shopsData = {
      id: shops_on_map[i]["id"],
      name: shops_on_map[i]["name"],
      address: shops_on_map[i]["address"],
      lat: shops_on_map[i]["latitude"],
      lng: shops_on_map[i]["longitude"],
    };
    markerData.push(shopsData);
  }

  // markerDataに入っているデータのピンを立てる。(googlemapに@shopsのピンを立てる)
  for (let i = 0; i < markerData.length; i++) {
    markerLatLng = new google.maps.LatLng({
      lat: markerData[i]["lat"],
      lng: markerData[i]["lng"],
    }); // 緯度経度のデータ作成
    marker[i] = new google.maps.Marker({
      // マーカーの追加
      position: markerLatLng, // マーカーを立てる位置を指定
      map: map, // マーカーを立てる地図を指定
    });

    // マーカーに表示する内容を設定
    contentStr =
      '<div name="marker" class="map">' +
      '<a href="/shops/' +
      markerData[i]["id"] +
      '" data-turbolinks="false">' +
      markerData[i]["name"] +
      "</a>" +
      '<p class="mb-0">' +
      "住所：" +
      markerData[i]["address"] +
      "</p>" +
      "</div>";

    // 吹き出しの追加
    infoWindow[i] = new google.maps.InfoWindow({
      content: contentStr, // 吹き出しに表示する内容をセット
    });
    markerEvent(i); // マーカーにクリックイベントを追加
  }
}

// マーカーを消すためのcurrentInfoWindow
let currentInfoWindow;
// マーカーにクリックイベントを追加
function markerEvent(i) {
  marker[i].addListener("click", function () {
    // マーカーをクリックしたとき
    if (currentInfoWindow) {
      // 表示している吹き出しがあれば閉じる
      currentInfoWindow.close();
    }
    infoWindow[i].open(map, marker[i]); // 吹き出しの表示
    currentInfoWindow = infoWindow[i];
  });
}
window.initMap = initMap;
