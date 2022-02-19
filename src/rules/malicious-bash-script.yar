/**
 *
 * 悪意のある bash スクリプトを検出するためのルールセット.
 *
 */

rule rm_no_preserve_root
{
    meta:
        description = "`rm -rf --no-preserve-root /` を検出する"

    strings:
        $s1 = "rm"
        $s2 = "--no-preserve-root"

    condition:
        $s1 and $s2
}

