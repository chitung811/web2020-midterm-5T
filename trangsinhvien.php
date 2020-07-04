<?php
echo "Danh sách khoa";
echo "<table style='border: solid 1px black;'>";
echo "<tr><th>Khoa</th><th>Năm thành lập</th></tr>";
class TableRows extends RecursiveIteratorIterator { 
    function __construct($it) { 
        parent::__construct($it, self::LEAVES_ONLY); 
    }
    function current() {
        return "<td style='width:150px;border:1px solid black;'>"
            . parent::current(). "</td>";
    }
    function beginChildren() { 
        echo "<tr>"; 
    } 
    function endChildren() { 
        echo "</tr>" . "\n";
    } 
} 
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "nguyenductai";
try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $stmt = $conn->prepare("SELECT TenKhoa, NamThanhLap FROM khoa"); 
    $stmt->execute();
    $result = $stmt->setFetchMode(PDO::FETCH_ASSOC); 
    foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) {
        echo $v;
    }
} catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
$conn = null;
echo "</table>";

echo "</br>";
echo "</br>";
echo "Danh sách lớp";
echo "<table style='border: solid 1px black;'>";
echo "<tr><th>Mã lớp</th><th>Khoa</th></tr>";
class TableRowLops extends RecursiveIteratorIterator { 
    function __construct($it) { 
        parent::__construct($it, self::LEAVES_ONLY); 
    }
    function current() {
        return "<td style='width:150px;border:1px solid black;'>"
            . parent::current(). "</td>";
    }
    function beginChildren() { 
        echo "<tr>"; 
    } 
    function endChildren() { 
        echo "</tr>" . "\n";
    } 
} 
try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $stmt = $conn->prepare("SELECT MaLop, TenLop FROM lop"); 
    $stmt->execute();
    $result = $stmt->setFetchMode(PDO::FETCH_ASSOC); 
    foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) {
        echo $v;
    }
} catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
$conn = null;
echo "</table>";

echo "</br>";
echo "</br>";
echo "Danh sách sinh viên";
echo "<table style='border: solid 1px black;'>";
echo "<tr><th>Mã sinh viên</th><th>Họ Tên</th><th>Ngày sinh</th><th>Email</th></tr>";
class TableRowSinhVIens extends RecursiveIteratorIterator { 
    function __construct($it) { 
        parent::__construct($it, self::LEAVES_ONLY); 
    }
    function current() {
        return "<td style='width:150px;border:1px solid black;'>"
            . parent::current(). "</td>";
    }
    function beginChildren() { 
        echo "<tr>"; 
    } 
    function endChildren() { 
        echo "</tr>" . "\n";
    } 
} 
try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $stmt = $conn->prepare("SELECT MaSV, HoTen, NgaySinh, Email FROM sinhvien"); 
    $stmt->execute();
    $result = $stmt->setFetchMode(PDO::FETCH_ASSOC); 
    foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) {
        echo $v;
    }
} catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
$conn = null;
echo "</table>";

echo "</br>";
echo "</br>";
echo "Danh sách môn học";
echo "<table style='border: solid 1px black;'>";
echo "<tr><th>Mã môn học</th><th>Tên môn học</th><th>Số tín chỉ</th></tr>";
class TableRowMonHocs extends RecursiveIteratorIterator { 
    function __construct($it) { 
        parent::__construct($it, self::LEAVES_ONLY); 
    }
    function current() {
        return "<td style='width:150px;border:1px solid black;'>"
            . parent::current(). "</td>";
    }
    function beginChildren() { 
        echo "<tr>"; 
    } 
    function endChildren() { 
        echo "</tr>" . "\n";
    } 
} 
try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $stmt = $conn->prepare("SELECT MaMH, TenMon, SoTC FROM monhoc"); 
    $stmt->execute();
    $result = $stmt->setFetchMode(PDO::FETCH_ASSOC); 
    foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) {
        echo $v;
    }
} catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
$conn = null;
echo "</table>";
?>