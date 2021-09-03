<?php
session_start();
function h($s)
{
    return htmlspecialchars($s, ENT_QUOTES, 'utf-8');
}
//ログイン済みの場合
if (isset($_SESSION['ID'])) {
    echo 'ようこそ' .  h($_SESSION['name']) . "さん<br>";
    echo "<a href='/session/logout.php'>ログアウトはこちら。</a>";
}

?>

<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="utf-8">
    <title>Login</title>
</head>

<body>
    <h1>ようこそ、ログインしてください。</h1>
    <form action="/session/login.php" method="post">
        <label for="email">email</label>
        <input type="email" name="email">
        <label for="password">password</label>
        <input type="password" name="password">
        <button type="submit">Sign In!</button>
    </form>
    <h1>初めての方はこちら</h1>
    <form action="/session/signup.php" method="post">
        <label>name</label>
        <input name="name">
        <label for="email">email</label>
        <input type="email" name="email">
        <label for="password">password</label>
        <input type="password" name="password">
        <button type="submit">Sign Up!</button>
        <p>※パスワードは半角英数字をそれぞれ１文字以上含んだ、８文字以上で設定してください。</p>
    </form>
</body>

</html>