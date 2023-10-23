//お金を受け取る人の情報
export type output = {
  //アドレス お金の行先
  to: string;
  //金額
  amount: number;
  //手数料
  fee: number;
};
