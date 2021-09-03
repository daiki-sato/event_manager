<?php
//データベースへ接続、テーブルがない場合は作成
try {
    include($_SERVER['DOCUMENT_ROOT'] . "/dbconnect.php");
} catch (Exception $e) {
    echo $e->getMessage() . PHP_EOL;
}
//パスワードの正規表現
if (preg_match('/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i', $_POST['password'])) {
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
} else {
    echo 'パスワードは半角英数字をそれぞれ1文字以上含んだ8文字以上で設定してください。';
    return false;
}
//登録処理
try {
    $sql = "INSERT INTO users ( name , password , email) VALUES (:name , :password , :email)";
    $stmt = $db->prepare($sql);
    $params = array(':name' => $_POST["name"] , ':password' => $password , ':email' => $_POST["email"]);
    $stmt->execute($params);
    echo '登録完了';
    echo '<a href="/login">loginページへ戻る</a>';
} catch (\Exception $e) {
    echo '登録済みのemailです。';
}
?>