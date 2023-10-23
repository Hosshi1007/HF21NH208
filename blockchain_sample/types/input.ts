// 入力者情報
export type Input = {
  // 登録時刻
  time: string;
  // アドレス (誰なのか、どこからなのか)
  from: string;
  // サイン (取引同意の署名)
  signature: string;
};
