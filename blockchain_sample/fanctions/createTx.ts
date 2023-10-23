import { Input } from "../types/input.ts";
import { output } from "../types/output.ts";
import { Tx } from "../types/tx.ts";

// Tx を作る
export function createTx(): Tx {
  // 取引 ID
  const txId = crypto.randomUUID();
  // 現在時刻
  const now = new Date().toISOString();
  // インプット
  const inputs: Input[] = [
    {
      time: now,
      from: "TaroWallet", //公開鍵をハッシュ化してエンコードし、複雑なアドレスをここで作成、要検討
      signature: "デジタル署名に同意します", //デジタル署名が必要、秘密鍵と公開鍵関係、要検討
    },
  ];
  // アウトプット
  const outputs: output[] = [
    {
      to: "HanakoWallet",
      amount: 20,
      fee: 3,
    },
  ];
  // Tx を組み立てる
  const tx: Tx = {
    id: txId,
    inputs: inputs,
    outputs: outputs,
  };

  return tx;
}
