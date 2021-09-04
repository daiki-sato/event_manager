<?php
require('dbconnect.php');
mb_language('ja');
mb_internal_encoding('UTF-8');

$stmt = $db->query("SELECT events.name, events.start_at , event_details.text , users.name as uesr_name , users.email FROM events
INNER JOIN event_attendance ON events.id = event_attendance.event_id
INNER JOIN event_details  ON events.id = event_details.event_id
INNER JOIN users ON event_attendance.user_id = users.id
WHERE event_attendance.status_id = 0 AND events.start_at >= DATE_ADD(CURDATE(), INTERVAL 3 DAY)  AND events.start_at <  DATE_ADD(CURDATE(), INTERVAL 4 DAY)
ORDER BY events.id");
$events = $stmt->fetchAll(PDO::FETCH_ASSOC);
foreach ($events as $event) {

    $to = $event["email"];
    $subject = $event["name"];
    $body = $event["text"];
    $headers = ["From" => "system@posse-ap.com", "Content-Type" => "text/plain; charset=UTF-8", "Content-Transfer-Encoding" => "8bit"];

    $name = $event["user_id"];
    $date = $event["start_at"];
    $event = $event["name"];
    $body = <<<EOT
    {$name}さん
    
    ${date}に${event}を開催します。
    参加／不参加の回答をお願いします。
    
    http://localhost/
    EOT;
    mb_send_mail($to, $subject, $body, $headers);
}

echo "メールを送信しました";
