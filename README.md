## アプリケーション名
ギャンブル家計簿

## アプリケーション概要
ギャンブルの収支を登録・確認し、自己管理をサポートすることができる。

## URL


## テスト用アカウント

## 利用方法
### 上限金額設定
1.トップページのヘッダーからユーザー新規登録を行う。
2.STEP1：上限金額設定から、月の投資額の上限を設定する。
3.上限を設定したら、登録ボタンを押す。

### 投資額の登録
1.STEP2:投資額の登録から、投資額を登録する。
2.日付、項目、投資額を設定し、登録ボタンを押す。

### 回収額の登録
1.STEP3:回収額の登録から、回収額を登録する。
2.日付、項目、投資額を設定し、登録ボタンを押す。(回収額がない場合は、何も登録しない)

### 月毎の収支の確認
1.月毎の収支を押し、月を選択する。
2.投資額、回収額、現状、あなたへのメッセージを確認する。

### 生涯収支の確認
1.生涯収支を押す。
2.収支と、あなたへのありがたいメッセージを確認する。


## アプリケーションを作成した背景
学生時代に、ギャンブルにハマりすぎて、依存しすぎてしまいそうという課題を持っている友人がいた。課題を分析した結果、「貯金が減っていることに気づいていない」ということが真因であるという仮説を立てた。同様の問題を抱えている方も多いと推測し、解決するために、収支を確認し、ギャンブルに依存しすぎないためのメッセージを残すアプリケーションを作成することにした。

## 実装した機能についてのGIF

[![Image from Gyazo](https://i.gyazo.com/3e6f998c1297395d7a670df9bb9816b1.gif)](https://gyazo.com/3e6f998c1297395d7a670df9bb9816b1)

[![Image from Gyazo](https://i.gyazo.com/f47a1f4d9ab20ce77130e592af8f8a11.gif)](https://gyazo.com/f47a1f4d9ab20ce77130e592af8f8a11)

収支を確認し、収支によってメッセージが変わる。

## データベース設計
[![Image from Gyazo](https://i.gyazo.com/8c132a73858823d2cf3171ebaf41524a.png)](https://gyazo.com/8c132a73858823d2cf3171ebaf41524a)

## 使用技術
・HTML
・CSS
・Ruby
・Rails
・JavaScript
・MySQL



## usersテーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| name               | string | null:false              |
| email              | string | null:false, unique:true |
| encrypted_password | string | null:false              |
| birthday           | date   | null:false              |

### Association
has_many :incomes
has_many :payments
has_one :limit

## incomesテーブル

| Column             | Type       | Options                      |
| ------------------ | ---------- | ---------------------------- |
| user               | references | null:false, foreign_key:true |
| price              | integer    | null:false                   |
| category_id        | integer    | null:false                   |
| date               | date       | null:false                   |

### Association
belongs_to :user
belongs_to :category, optional:true

## paymentsテーブル

| Column             | Type       | Options                      |
| ------------------ | ---------- | ---------------------------- |
| user               | references | null:false, foreign_key:true |
| price              | integer    | null:false                   |
| category_id        | integer    | null:false                   |
| date               | date       | null:false                   |

### Association
belongs_to :user
belongs_to :category, optional:true


## limitsテーブル

| Column             | Type       | Options                      |
| ------------------ | ---------- | ---------------------------- |
| user               | references | null:false, foreign_key:true |
| goal               | integer    | null:false                   |

### Association
belongs_to :user


## Categoriesテーブル

| Column | Type   | Options    |
| ------ | ------ | ---------- |
| name   | string | null:false |

### Association
has_many :incomes
has_many :payments

## ローカルでの動作方法

## 工夫したポイント
・ユーザーが見て、わかりやすくなるようにSTEP毎に収支を登録できるようにした。
・依存症になってしまうのを防ぐために、収支がマイナスの時は、辞めることを促すメッセージを記載した。


## これから実装したい機能
・収支をグラフで見れるようにする機能
・項目毎の収支がわかるようにするための機能