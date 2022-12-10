document.addEventListener("DOMContentLoaded", function () {
  const visit = document.getElementById("button");
  visit.addEventListener("click", () => {
    if (navigator.geolocation) {
      // 現在地を取得
      navigator.geolocation.getCurrentPosition(
        (position) => {
          let data = position.coords;
          let currentLat = data.latitude;
          let currentLng = data.longitude;
          let shopLat = gon.shop_lat;
          let shopLng = gon.shop_lng;

          // 2つの位置から距離を測定する関数
          const R = Math.PI / 180;
          function distance(lat1, lng1, lat2, lng2) {
            lat1 *= R;
            lng1 *= R;
            lat2 *= R;
            lng2 *= R;
            return (
              6371 *
              Math.acos(
                Math.cos(lat1) * Math.cos(lat2) * Math.cos(lng2 - lng1) +
                  Math.sin(lat1) * Math.sin(lat2)
              )
            );
          }

          let toDistance = distance(currentLat, currentLng, shopLat, shopLng);
          let shopId = gon.shop_id;
          // 現在地から1km以内かを判定する
          if (toDistance < 1) {
            $.ajax({ url: `/shops/${shopId}/visit`, type: "POST" });
          } else {
            window.alert("店舗に近づいてください");
          }
        },
        (error) => {
          var errorInfo = [
            "原因不明のエラーが発生しました",
            "位置情報の取得が許可されませんでした。設定を確認してください。",
            "電波状況などで位置情報が取得できませんでした",
            "位置情報の取得に時間がかかり過ぎてタイムアウトしました",
          ];
          var errorNum = error.code;
          var errorMessage = errorInfo[errorNum];
          alert(errorMessage);
        }
      );
    } else {
      window.alert("お使いの端末では現在地取得に対応しておりません。");
    }
  });
});
