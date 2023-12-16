function caltime(inputDateTime) {
    // 日時文字列をDateオブジェクトに変換
    const targetDate = new Date(inputDateTime.replace(/-/g, '/'));
    console.log(targetDate + "aa");

    // 現在時刻を取得
    const now = new Date();

    // 時差補正（日本の場合は9時間）
    const timeZoneOffset = 9 * 60 * 60 * 1000;
    const targetTime = targetDate.getTime() + timeZoneOffset;
    const currentTime = now.getTime() + timeZoneOffset;

    // 時差補正後の差を計算
    const timeDifference = currentTime - targetTime;

    // 差を秒単位に変換
    const secondsDifference = Math.floor(timeDifference / 1000);

    if (secondsDifference >= 24 * 60 * 60) {
        const days = Math.floor(secondsDifference / (24 * 60 * 60));
        document.querySelectorAll('.content1 .a')[0].innerText = `${days}日前`;
        //return `${days}日前`;
    } else if (secondsDifference >= 60 * 60) {
        const hours = Math.floor(secondsDifference / (60 * 60));
        document.querySelectorAll('.content1 .a')[0].innerText = `${hours}時間前`;
        //return `${hours}時間前`;
    } else if (secondsDifference >= 60) {
        const minutes = Math.floor(secondsDifference / 60);
        document.querySelectorAll('.content1 .a')[0].innerText = `${minutes}分前`;
        //return `${minutes}分前`;
    } else {
    	document.querySelectorAll('.content1 .a')[0].innerText = `${secondsDifference}秒前`;
        //return `${secondsDifference}秒前`;
    }
}
