function redirectToWave(waveID) {
	  // waveIDに値をセット
	  var destination = '/HF21/servlet/selectwave?waveID=' + waveID;

	  // ページのリダイレクト
	  location.href = destination;
}