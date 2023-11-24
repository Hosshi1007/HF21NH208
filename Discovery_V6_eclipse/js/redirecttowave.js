function redirectToWave(waveID) {
  // waveIDに値をセット
  var destination = '/HF21/wave.jsp?waveID=' + waveID;

  // ページのリダイレクト
  location.href = destination;
}