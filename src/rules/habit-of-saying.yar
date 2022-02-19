/**
 *
 * 口癖の濫用を検出するためのルールセット.
 *
 */

rule akan
{
    meta:
        description = "[あかん] or [アカン] を 3 回以上含む"

    strings:
        $s1 = "あかん"
        $s2 = "アカン"

    condition:
        #s1 + #s2 >= 3
}

rule shirankedo
{
    meta:
        description = "[知らんけど] or [しらんけど] を 3 回以上含む"

    strings:
        $s1 = "知らんけど"
        $s2 = "しらんけど"

    condition:
        #s1 + #s2 >= 3
}

