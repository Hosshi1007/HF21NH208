import { Tx } from "../types/tx.ts";
import { Validator } from "../types/validator.ts";
/// Hash (SHA256)
export async function hash(str: string): Promise<string> {
  const u8Ary = new TextEncoder().encode(str);
  const digest = await crypto.subtle.digest("SHA-256", u8Ary);
  const rawHash = Array.from(new Uint8Array(digest));
  return rawHash.map((b) => b.toString(16).padStart(2, "0")).join("");
}

// ブロックのハッシュを計算する
export async function calcBlockHash(
  index: number,
  time: string,
  prev_hash: string,
  tx: Tx,
  validator: Validator,
): Promise<string> {
  // ブロックの中身を文字にして繋げる
  const str = index.toString() +
    // 登録時刻
    time +
    //一つ前のブロックのハッシュ
    prev_hash +
    //JSON.stringifyはJSON文字列に変換するもの
    //トランザクション 取引記録
    JSON.stringify(tx) +
    //このブロックを保証してくれるバリデーター
    JSON.stringify(validator);

  return await hash(str);
}
