$(document).ready(function () {
   var time = 3; // 秒数の指定
   var $bar, $slick, isPause, tick, percentTime;

   $slick = $(".slider");
   $slick.slick({
      // slickのオプション指定
      draggable: true,
      adaptiveHeight: false,
      dots: true,
      mobileFirst: true,
      pauseOnDotsHover: true,
      fade: true,
      arrows: false,
   });

   $bar = $(".slider .slick-dots li.slick-active button");

   $(".wrap_slider").on({
      // マウスイベントの指定
      mouseenter: function () {
         isPause = true; // マウスが乗ったらtrue
      },
      mouseleave: function () {
         isPause = false; // マウスが離れたらfalse
      },
   });

   function startProgressbar() {
      // プログレスバーの動きを繰り返す指定
      resetProgressbar();
      percentTime = 0;
      isPause = false;
      tick = setInterval(interval, 10);
   }

   function interval() {
      // プログレスバーの間隔の指定
      if (isPause === false) {
         percentTime += 1 / (time + 0.1);
         $bar.css({
            width: percentTime + "%",
         });
         if (percentTime >= 100) {
            $slick.slick("slickNext");
            startProgressbar();
         }
      }
   }

   function resetProgressbar() {
      // ドットのアクティブな状態を設定し直す指定
      $bar = $(".slider .slick-dots li.slick-active button");
      $bar.css({
         width: 0 + "%",
      });
      clearTimeout(tick);
   }
   startProgressbar();
});
