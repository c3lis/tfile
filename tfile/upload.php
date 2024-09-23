<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $targetDir = "/home/nouser/Desktop/Tools/tfile/tfile/uploads/";
    $targetFile = $targetDir . basename($_FILES["archivo"]["name"]);

    // Crea el directorio si no existe
    if (!is_dir($targetDir)) {
        mkdir($targetDir, 0777, true);
    }

    // Intenta mover el archivo subido
    if (move_uploaded_file($_FILES["archivo"]["tmp_name"], $targetFile)) {
        echo "El archivo ". htmlspecialchars(basename($_FILES["archivo"]["name"])) . " ha sido subido.";
    } else {
        echo "Lo siento, ha ocurrido un error al subir tu archivo.";
    }
}
?>
