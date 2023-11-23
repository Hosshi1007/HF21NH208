function displayImages(event) {
  var input = event.target;
  var imageContainer = document.getElementById('imageContainer');

  // すべての img を非表示にする
  var allImages = document.querySelectorAll('img');
  for (var i = 0; i < allImages.length; i++) {
    allImages[i].style.display = 'none';
  }

  // FileListオブジェクトを配列に変換
  var files = Array.from(input.files);

  // 選択されたファイルがあるかどうかを確認
  if (files.length > 0) {

    // 選択されたファイルが4つ以上ある場合は、最初の4つだけを処理
    var filesToDisplay = files.slice(0, 4);

    for (var i = 0; i < filesToDisplay.length; i++) {
      var reader = new FileReader();
      var imageId = 'selectedImage' + (i + 1);
      var image = document.getElementById(imageId);

      reader.onload = (function(img) {
        return function(e) {
          img.src = e.target.result;
          // 表示するimg要素のみを表示し、他は非表示にする
          img.style.display = 'block';
        };
      })(image);

      reader.readAsDataURL(filesToDisplay[i]);
    }

    // imageContainerを表示
    imageContainer.style.display = 'flex';
  } else {
    // 選択されたファイルがない場合はimageContainerを非表示
    imageContainer.style.display = 'none';
  }
}