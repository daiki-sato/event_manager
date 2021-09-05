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
    echo '<a href="/auth/ressetpassword/send_resetmail/">再設定ページへ戻る</a>';
    return false;
}
//登録処理
try {
    $sql = "INSERT INTO users ( name , password , email , github_id) VALUES (:name , :password , :email , :github_id) ON DUPLICATE KEY 
    UPDATE password = :password , reset_pass = null";
    $stmt = $db->prepare($sql);
    $params = array(':name' => $_POST["name"] , ':password' => $password , ':email' => $_POST["email"] , ':github_id'=> $_POST["github_id"]);
    $stmt->execute($params);
    echo '登録完了';
    echo '<a href="/auth/login">ログインページへ戻る</a>';
} catch (\Exception $e) {
    echo 'エラーまたは登録済みのemailです。';
    echo '<a href="/auth/login">ログインページへ戻る</a>';
}
