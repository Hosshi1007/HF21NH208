import { Input } from "./input.ts";
import { output } from "./output.ts";
//ブロック

//トランザクション 取引記録
export type Tx = {
  //取引のID
  id: string;
  //入力
  inputs: Input[];
  //出力
  outputs: output[];
};
