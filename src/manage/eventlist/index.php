<?php
include($_SERVER['DOCUMENT_ROOT'] . "/dbconnect.php");
$stmt = $db->query('SELECT events.id, events.name, events.start_at, events.end_at, count(event_attendance.id) AS total_participants FROM events LEFT JOIN event_attendance ON events.id = event_attendance.event_id WHERE start_at >= CURRENT_DATE() AND user_id=1 AND status_id=1 GROUP BY events.id ORDER BY start_at;');
$events = $stmt->fetchAll();

function get_day_of_week ($w) {
  $day_of_week_list = ['日', '月', '火', '水', '木', '金', '土'];
  return $day_of_week_list["$w"];
}

?>

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
        <img src="../../img/header-logo.png" alt="" class="h-full">
      </div>
      <div><a href="#">イベント一覧</a></div>
      <div><a href="../eventadd/eventform.php">イベント追加</a></div>
      <div><a href="../eventadd/eventform.php">ユーザー追加</a></div>
    </div>
  </header>

  <main class="bg-gray-100">
    <div class="w-full mx-auto p-5">
      <div id="events-list">
        <div class="flex justify-between items-center mb-3">
          <h2 class="text-sm font-bold">一覧</h2>
        </div>

       
        <!-- ページング実装 -->
        <?php

define('MAX','10'); // 1ページの記事の表示数定義

$All_events_number_sql = 'SELECT count(*)FROM events';// トータルデータ件数
$All_events_number = $db->query($All_events_number_sql)->fetch(PDO::FETCH_COLUMN);// イベントデータを配列に入れる

$All_events ="SELECT*FROM events";// イベントデータを引っ張る
$event_contents = $db->query($All_events)->fetchAll();// イベントデータを配列に入れる


            
// $events_num = count($All_events); // トータルデータ件数
$max_page = ceil($All_events_number / MAX); // トータルページ数※floorは小数点をあげる関数

if(!isset($_GET['page_id'])){ // $_GET['page_id'] はURLに渡された現在のページ数
    $now = 1; // 設定されてない場合は1ページ目にする
}else{
    $now = $_GET['page_id'];
}
 
$start_no = ($now - 1) * MAX; // 配列の何番目から取得すればよいか
 
// array_sliceは、配列の何番目($start_no)から何番目(MAX)まで切り取る関数
$disp_data = array_slice($event_contents, $start_no, MAX, true);
?> 
  <?php foreach($disp_data as $event) : ?>
    <?php
    $start_date = strtotime($event['start_at']);
    $end_date = strtotime($event['end_at']);
    $day_of_week = get_day_of_week(date("w", $start_date));
    ?>
    <div class="modal-open bg-white mb-3 p-4 flex justify-between rounded-md shadow-md cursor-pointer" id="event-<?php echo $event['id']; ?>">
      <div>
        <h3 class="font-bold text-lg mb-2"><?php echo $event['name'] ?></h3>
        <p><?php echo date("Y年m月d日（${day_of_week}）", $start_date); ?></p>
        <p class="text-xs text-gray-600">
          <?php echo date("H:i", $start_date) . "~" . date("H:i", $end_date); ?>
        </p>
      </div>
      <div class="flex flex-col justify-between text-right">
        <div>
          <?php if ($event['id'] % 3 === 1) : ?>
            <!--
            <p class="text-sm font-bold text-yellow-400">未回答</p>
            <p class="text-xs text-yellow-400">期限 <?php echo date("m月d日", strtotime('-3 day', $end_date)); ?></p>
            -->
          <?php elseif ($event['id'] % 3 === 2) : ?>
            <!-- 
            <p class="text-sm font-bold text-gray-300">不参加</p>
            -->
          <?php else : ?>
            <!-- 
            <p class="text-sm font-bold text-green-400">参加</p>
            -->
          <?php endif; ?>
        </div>
        <p class="text-sm"><span class="text-xl"><?php echo $event['total_participants']; ?></span>人参加 ></p>
      </div>
    </div>
  <?php endforeach; ?>

 <?php
for($i = 1; $i <= $max_page; $i++){ // 最大ページ数分リンクを作成
    if ($i == $now) { // 現在表示中のページ数の場合はリンクを貼らない
        echo $now. '　'; 
    } else {
        echo '<a href="/manage/eventlist/index.php?page_id='. $i. '")>'. $i. '</a>';
    }
}
 
?>
      </div>
    </div>
  </main>

  <div class="modal opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center">
    <div class="modal-overlay absolute w-full h-full bg-black opacity-80"></div>

    <div class="modal-container absolute bottom-0 bg-white w-screen h-4/5 rounded-t-3xl shadow-lg z-50">
      <div class="modal-content text-left py-6 pl-10 pr-6">
        <div class="z-50 text-right mb-5">
          <svg class="modal-close cursor-pointer inline bg-gray-100 p-1 rounded-full" xmlns="http://www.w3.org/2000/svg" width="34" height="34" viewBox="0 0 18 18">
            <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z"></path>
          </svg>
        </div>

        <div id="modalInner"></div>

      </div>
    </div>
  </div>

  <script src="/js/index.js"></script>
</body>

</html>