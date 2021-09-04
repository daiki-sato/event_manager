<?php
session_start();
require('../dbconnect.php');
header('Content-Type: application/json; charset=UTF-8');

if (isset($_GET['eventId'])) {
  $eventId = htmlspecialchars($_GET['eventId']);
  $userId  = $_SESSION["ID"];
  try {
    $stmt = $db->prepare('SELECT events.id, events.name, events.start_at, events.end_at, count(event_attendance.id) AS total_participants FROM events LEFT JOIN event_attendance ON events.id = event_attendance.event_id WHERE events.id = ? GROUP BY events.id');
    $stmt->execute(array($eventId));
    $event = $stmt->fetch();

    $stmt = $db->prepare('SELECT text  FROM event_details  WHERE event_details.event_id = ? ');
    $stmt->execute(array($eventId));
    $event_detail = $stmt->fetch();

    $stmt = $db->query("SELECT status_id , status.name  FROM event_attendance INNER JOIN status ON event_attendance.status_id = status.id WHERE  event_attendance.user_id = $userId AND  event_attendance.event_id = $eventId");
    $status_id = $stmt->fetch();
    
    $start_date = strtotime($event['start_at']);
    $end_date = strtotime($event['end_at']);

    $eventMessage = date("Y年m月d日", $start_date) . '（' . get_day_of_week(date("w", $start_date)) . '） ' . date("H:i", $start_date) . '~' . date("H:i", $end_date) . 'に' . $event['name'] . 'を開催します。<br>ぜひ参加してください。';

    if ($event['id'] % 3 === 1) $status = 0;
    elseif ($event['id'] % 3 === 2) $status = 1;
    else $status = 2;

    $array = [
      'id' => $event['id'],
      'name' => $event['name'],
      'date' => date("Y年m月d日", $start_date),
      'day_of_week' => get_day_of_week(date("w", $start_date)),
      'start_at' => date("H:i", $start_date),
      'end_at' => date("H:i", $end_date),
      'total_participants' => $event['total_participants'],
      'message' => $eventMessage,
      'status' => $status,
      'status_id' => $status_id["status_id"],
      'status' => $status_id["name"],
      'event_detail' => $event_detail["text"],
      'deadline' => date("m月d日", strtotime('-3 day', $end_date)),
    ];
    
    echo json_encode($array, JSON_UNESCAPED_UNICODE);
  } catch(PDOException $e) {
    echo $e->getMessage();
    exit();
  }
}

function get_day_of_week ($w) {
  $day_of_week_list = ['日', '月', '火', '水', '木', '金', '土'];
  return $day_of_week_list["$w"];
}