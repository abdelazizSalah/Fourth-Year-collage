<?php
function throwError($num){
    if($num < 3)
        throw new Exception("The given value must be more than 3"); 
    return $num; 
}

try {
    echo throwError(4);
    echo "\n";
    echo throwError(2);
} catch (Exception $e) {
    echo 'Message of error is: '.$e->getMessage(); 
}
?>