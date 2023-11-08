// 流れるテキスト追加　ここから

const randRange = (min, max) =>
   Math.floor(Math.random() * (max - min + 1) + min); //ランダム関数
let html = "";
let container = $(".container");
for (let i = 0; i < 15; i++) {
   html +=
      '<p style="animation-duration:' +
      randRange(8, 15) +
      "s;animation-delay:" +
      randRange(1, 10) +
      's;">' +
      '<a href="#">テストテキスト0' +
      i +
      "(2023/11/06)</a>" +
      "</p>";
}
container.append(html); //流れるテキスト挿入

// 流れるテキスト追加　ここまで

// 流れるテキストをランダム配置　ここから

let item = container.find("p");
let cont_h = container.height(); //コンテンツ高さ取得

item.each(function (index) {
   $(this).css({
      top: randRange(0, cont_h),
      "font-size": randRange(15, 25) + "px",
   });
});

// 流れるテキストをランダム配置　ここまで
