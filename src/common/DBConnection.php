class DBConnection
{
private $conn;
private $host;
private $user;
private $password;
private $dbName;
private $port;

function __construct($params = array())
{
$this->conn = false;
$this->host = 'localhost';
$this->user = 'postgrea'; // Change to your PostgreSQL username
$this->password = 'Shinde@123'; // Change to your PostgreSQL password
$this->dbName = 'hrm';
$this->port = '5432'; // Change to your PostgreSQL port number
$this->connect();
}

function __destruct()
{
$this->disconnect();
}

private function connect()
{
if (!$this->conn) {
try {
$this->conn = new PDO('pgsql:host=' . $this->host . ';dbname=' . $this->dbName . ';user=' . $this->user . ';password=' .
$this->password);
if (!$this->conn) {
$this->status_fatal = true;
echo 'Connection BDD failed';
die();
}
} catch (Exception $e) {
die('Erreur : ' . $e->getMessage());
}
}
return $this->conn;
}

function disconnect()
{
if ($this->conn) {
$this->conn = null;
}
}

function getOne($query)
{
$result = $this->conn->prepare($query);
$ret = $result->execute();

if (!$ret) {
echo 'PDO::errorInfo():';
echo '<br />';
echo 'error SQL: ' . $query;
die();
}

$result->setFetchMode(PDO::FETCH_ASSOC);
$response = $result->fetch();

return $response;
}

function getAll($query)
{
$result = $this->conn->prepare($query);
$ret = $result->execute();

if (!$ret) {
echo 'PDO::errorInfo():';
echo '<br />';
echo 'error SQL: ' . $query;
die();
}

$result->setFetchMode(PDO::FETCH_ASSOC);
$response = $result->fetchAll();

return $response;
}

function execute($query)
{
$response = $this->conn->exec($query);

if ($response === false) {
echo 'PDO::errorInfo():';
echo '<br />';
echo 'error SQL: ' . $query;
die();
}

return $response;
}
}

// Example usage:
// $dbConn = new DBConnection();
// print_r($dbConn->getAll("SELECT * FROM admins"));