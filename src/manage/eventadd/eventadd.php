<?php
include($_SERVER['DOCUMENT_ROOT'] . "/dbconnect.php");

// eventsに追加
$sql = "INSERT INTO events (id , name , start_at , end_at) 
          VALUES (:id , :name , :start_at , :end_at)
          ON DUPLICATE KEY UPDATE updated_at = now()";


$stmt = $db->prepare($sql);

$params = array(':id' => (int)$_POST["id"], ':name' => $_POST["name"], ':start_at' => $_POST["start_at"], ':end_at' => $_POST["end_at"]);

$stmt->execute($params);

if ($_POST['id']) {
  $eventId = $_POST['id'];
} else {
  $eventId = $db->lastInsertId();
}

$sql = "INSERT INTO event_details ( id , event_id , text )
        VALUES (:id , :event_id , :text )";

$stmt = $db->prepare($sql);

$params = array(':id' => (int)$_POST["id"], ':event_id' => $eventId, ':text' => $_POST["text"]);

$stmt->execute($params);

echo '登録完了しました';
?>

<a href="/manage/eventadd/eventform.php">イベント追加ページに戻る</a>
<a href="/manage/eventlist/">追加したイベントの一覧ページに戻る</a>