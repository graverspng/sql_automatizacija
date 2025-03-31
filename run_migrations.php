<?php
$dbHost = "localhost";
$dbUser = "root";
$dbPass = "";
$dbName = "pet_shop";

try {
    $pdo = new PDO("mysql:host=$dbHost;charset=utf8mb4", $dbUser, $dbPass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
    ]);

    $pdo->exec("CREATE DATABASE IF NOT EXISTS `$dbName` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;");
    echo "Database '$dbName' created or already exists.\n";

    $pdo->exec("USE `$dbName`");
    echo "Connected to the database '$dbName'.\n";

    $sqlFiles = glob("*.sql");
    sort($sqlFiles);

    foreach ($sqlFiles as $file) {
        echo "Processing: $file...\n";
        $sql = file_get_contents($file);

        foreach (explode(";", $sql) as $statement) {
            $statement = trim($statement);
            if (!empty($statement)) {
                try {
                    $pdo->exec($statement);
                } catch (PDOException $e) {
                    echo "Error in file $file, statement: $statement\nMessage: " . $e->getMessage() . "\n";
                }
            }
        }
    }

    echo "All migrations executed successfully.\n";
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage() . "\n";
}
?>
