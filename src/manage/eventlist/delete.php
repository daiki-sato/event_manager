<?php
include($_SERVER['DOCUMENT_ROOT'] . "/dbconnect.php");

// イベント削除
try {
    $stmt = $db->prepare('DELETE FROM events WHERE id = :id');
    $stmt->execute(array(':id' => $_GET["delete"]));

    echo "削除しました。";
} catch (Exception $e) {
    echo 'エラーが発生しました。:' . $e->getMessage();
}
?>
<!-- 追加したイベントの一覧に戻るボタン -->
<a href="http://localhost/manage/eventlist/">追加したイベントの一覧ページに戻る</a>