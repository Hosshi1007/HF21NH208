import { Block } from "../types/block.ts";
import { Tx } from "../types/tx.ts";
import { Validator } from "../types/validator.ts";
import { calcBlockHash } from "./calcBlockHash.ts";

// 新しいブロックを作る
export async function createBlock(
  prevBlock: Block,
  tx: Tx,
  validator: Validator,
): Promise<Block> {
  // 現在時刻
  //.toISOString() ISOメソッド型に変換するもの
  const time = new Date().toISOString();
  // インデックス 何番目のブロックか
  // prevBlock.indexで渡された一つ前のブロックに＋１する
  const index = prevBlock.index + 1;
  // ハッシュ
  const hash = await calcBlockHash(
    index,
    time,
    prevBlock.hash,
    tx,
    validator,
  );
  // 新しいブロック
  const newBlock: Block = {
    index: index,
    time: time,
    prev_hash: prevBlock.hash,
    hash: hash,
    tx: tx,
    validator: validator,
  };

  //新しいブロックを返す
  return newBlock;
}
