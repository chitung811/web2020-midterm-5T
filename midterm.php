<?php
echo "<table style='border: solid 1px black;'>";
echo "<tr><th>MaSV</th><th>Ten</th><th>Diem</th></tr>";
 
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
$dbname = "midterm";
 
try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $stmt = $conn->prepare("SELECT MaSV,Ten,Diem
							FROM ketqua
							JOIN sinhvien ON ketqua.MaSV = sinhvien.MaSV"); 
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