<?php include($_SERVER['DOCUMENT_ROOT'] . "/dbconnect.php");

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

<body>
  
  <div class="event__add">
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
  <a class="event__add__top__back__button" href="../eventlist/index.php">トップへ戻る</a>
</div>
</body>
</html>