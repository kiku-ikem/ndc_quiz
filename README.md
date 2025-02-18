## サービス概要
- 図書をランダムに数問出題し、その図書の日本十進分類法（NDC）の1桁目（類）を当てるゲームです。
- NDCは多くの図書館で採用される分類方法で、これを基に図書が配架されています。
- このゲームを通じ、図書館内で効率的なブラウジングが可能になり、様々図書との出会いを促します。

## このサービスへの思い・作りたい理由
私自身が司書資格を取得する過程でNDCの知識を身に付けた経験から、以下のような変化を実感しました。
- 利用者として図書館を利用する際、NDCの理解により図書へのアクセスが効率化された。
- 検索に頼らず、あたりをつけて書架に向かうことで、その道程で自分に合った図書との出会いが生まれた。
この経験をもとに、もっと多くの人に図書館との豊かな関わりを持ってもらいたいと考え、本サービスを企画しました。

## ユーザー層について
図書館利用の可能性があるすべての方を対象としますが、特に図書館のライトユーザーに焦点を当てています。
NDCの知識を楽しく学ぶことで、図書館の利用の仕方が変わり、図書との新たな接点を持つきっかけになると期待しています。

## サービスの利用イメージ
- ログイン機能はありますが、ログインしなくてもゲームはプレイ可能です。
- ログインすると、出題図書をお気に入り登録することができ、一覧表示できます。また、過去に出題された図書も振り返ることができるようになります。
- 1回あたり5問の問題で構成され、気軽にチャレンジできます。
- シンプルなゲームを通じて、図書館利用の楽しさや新たな発見の機会を提供します。

## ユーザーの獲得について
X（旧Twitter）などのSNSで「#図書館」などのハッシュタグを活用し、情報発信を行います。

## サービスの差別化ポイント・推しポイント
[十進分類法を覚えよう！NDCゲーム](https://unityroom.com/games/ndc10) という類似サービスは存在しますが、当アプリは以下の点で差別化を図ります。
- **詳細な書誌情報の提供**
  出題される図書の情報を表示し、回答しやすい設計にします。
- **不正解時のフィードバック**
  間違えた際に正解を表示し、ユーザーの理解を助けます。
- **お気に入り登録機能**
  気になった図書をお気に入りに登録でき、後から確認できるようにします。

## 機能候補

### MVPリリース
- サインアップ機能
- ログイン・ログアウト機能
- 問題出題機能（データの事前投入を含む）
- 正解表示機能
- 結果画面表示機能
- お気に入り図書の登録・削除機能
- お気に入り図書一覧表示機能

### 本リリースまでに実装予定
- プライバシーポリシー
- お問い合わせ
- 利用規約
- 管理画面（図書の検索・追加・削除・情報の更新）
- レスポンシブ
- 過去に出題した図書の履歴表示機能
- 同一図書の再出題を防ぐ仕組み
- 国立国会図書館のAPIを活用した図書データの定期更新機能

## 機能の実装方針予定
- **ログイン・ログアウト機能** sorceryを使用します。
- **管理画面の検索** ransackを使用する予定です。
- **API連携による図書データ更新**
  手動で行う図書データの管理の他に、[国立国会図書館のAPI](https://ndlsearch.ndl.go.jp/help/api/specifications) およびwheneverを利用し、出題可能な図書データを自動で定期的に取得する仕組みを実装する予定です。

## 将来的なアプリの拡張など、検討している事項
- どれくらいの問題に正解したかを表示するなど、ログイン後に利用できる機能の充実を検討中です。
- 投入した図書についての情報をトップページなどに表示するニュース機能を検討中です。

### 画面遷移図
Figma：https://www.figma.com/design/8sLRrEYv4OhuvmiFCmLamW/ndc-quiz?node-id=0-1&t=F5FpR7h7EuIlqzVs-1