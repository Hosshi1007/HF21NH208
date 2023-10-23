//ブックチェーンのブロック作成

//作成したTx型をインポートする
import { Tx } from "./tx.ts";
//作成したValidator型をインポートする
import { Validator } from "./validator.ts";

//ブロック
export type Block = {
  //何番目のブロックか
  //index(変数) number（型）
  index: number;

  //ブロックを作った時刻
  time: string;

  //一つ前のブロックのハッシュ
  prev_hash: string;

  //このブロックのハッシュ
  hash: string;

  //トランザクション（ブロックの中に閉じ込めておくデータ）
  //Tx型はtypescriptに存在しないため作成する
  tx: Tx;

  //このブロックを保証してくれるバリデーター
  //validator型はtypescriptに存在しないため作成する
  validator: Validator;
};
