/**
 *
 * EICAR を検出するためのルールセット.
 *
 */

rule eicar
{
    meta:
        description = "EICAR を検出する"

    strings:
        // 出力されるメッセージ
        $message = "EICAR-STANDARD-ANTIVIRUS-TEST-FILE!"

        // 先頭 8 バイト
        $leading_bytes = {58 35 4f 21 50 25 40 41}

    condition:
        $message or $leading_bytes
}

