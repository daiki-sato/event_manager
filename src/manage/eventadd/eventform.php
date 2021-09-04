<?php include($_SERVER['DOCUMENT_ROOT'] . "/dbconnect.php");

?>

<?php
$id = $_GET['id'];
?>
<?php if (isset($id)) { ?>
  <?php
  $detail_contents_value = "SELECT* FROM events INNER JOIN event_details ON events.id = event_details.event_id WHERE events.id = $id";
  $detail_contents = $db->query($detail_contents_value)->fetch();
  ?>
<?php } ?>

<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
  <title>Schedule | POSSE</title>
  <link rel="stylesheet" href="style.css">
</head>

<body>
  <header class="h-16">
    <div class="flex justify-between items-center w-full h-full mx-auto pl-2 pr-5">
      <div class="h-full">
        <img src="/img/header-logo.png" alt="" class="h-full">
      </div>
      <div class="box1">
        <div class="box"><a href="/manage/eventlist/index.php">イベント一覧</a></div>
        <div class="box"><a href="/manage/eventadd/eventform.php">イベント追加</a></div>
        <div class="box"><a href="/eventadd/eventform.php">ユーザー追加</a></div>
      </div>
    </div>
  </header>
</body>

<div class="form">
  <form class="event__add__form" action="/manage/eventadd/eventadd.php" method="post">
    イベント名
    <input class="event__add__form__event__place event__add__form__item" type="textarea" name="name" value="<?= $detail_contents['name'] ?>">
    開始日時
    <input placeholder="2020-08-09" class="event__add__form__event__date event__add__form__item" type="text" name="start_at" value="<?= $detail_contents['start_at'] ?>">
    終了日時
    <input placeholder="2020-08-09" class="event__add__form__event__date event__add__form__item" type="text" name="end_at" value="<?= $detail_contents['end_at'] ?>">
    イベント詳細
    <textarea class="event__add__form__event__detail" name="text" rows="7" cols="150"><?= $detail_contents["text"] ?></textarea>
    <input class="event__add__form__button" type="submit" value="送信">
    <input type="hidden" value="<?= $id ?>" name="id">
  </form>
</div>
<?= $_POST['event_name'] ?>
<hr>
<div class="event__add__back">
  <a class="event__add__top__back__button" href="/manage/eventlist/index.php">トップへ戻る</a>
</div>
</body>

</html>