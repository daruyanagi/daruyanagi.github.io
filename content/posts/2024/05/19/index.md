---
date: 2024-05-19T00:55:22.4371836+09:00
title: Hugo ブログに全文検索機能を付けました
tags: ['Hugo']
images:
- post-cover.png
---

![開発中の検索画面のスクリーンショット](image1.png)

ブログに全文検索機能を付けました。 [/search](/search) から利用できます。

ソースコードは、ほぼ「まくまく Hugo ノート」からいただきました。ありがとうございます。

{{< webcard "https://maku77.github.io/p/p4n5m3i/" >}}

加えた変更は、以下の通り。

{{< webcard "https://github.com/daruyanagi/daruyanagi.github.io/commit/a87de3056a291b7d4fe3fe5625f4c7814137964d" >}}

- ナビゲーションリンクへの追加
- content/search.md
- layouts/_default/search.html （利用しているテーマに馴染ませるために細部を変更）

独自の改良としては、テキストフラグメント（#:~:text=）に対応させました。これで検索結果のリンクをクリックすると、リンク先にジャンプして、検索ワードがハイライト＆出現箇所までスクロールされます。iOS では動かなかったのですが（未対応？）、デスクトップであれば Edge/Chrome などで動作するようです。

{{< twitter user="status" id="1791797956770955608" >}}

これはなかなか便利なのではないでしょうか！

## 今後の課題

- モダンな Javascript でリファクタリングしたい。フォーマット書式とか使えるはず
- [前のブログ](https://blog.daruyanagi.jp/) で思ったんだけど、記事本数が多くなると `/search` のファイルサイズが大きくなる。いずれは対策が必要になるかもしれない