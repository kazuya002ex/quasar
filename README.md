# README

## RELIER

- このアプリケーションは「1行小説リレー」というものです。

## Setup

```
  # このリポジトリをローカルに取り込む
  git clone https://github.com/kazuya002ex/quasar.git

  # dockerのセットアップ方法

  # コンテナをbuildする
  docker-compose build

  # コンテナを起動
  docker-compose up -d

  # DBを作成する
  docker-compose run web rails db:create db:migrate
```

- DBに変更があった場合

```
  # 現在のDBを削除し、DBを再構築する
  docker-compose run web rails db:migrate:reset

  # 開発データを投入する
  docker-compose run web rails db:seed

  # Gemfileの変更を取り込む
  docker-compose build
```

## サーバアクセス

- サーバのデフォルト値

https://localhost:3009

## 概要

- Ruby 2.7.0
- Rails 6.1.0
- MySQL 5.7.32
