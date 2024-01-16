<?php 
abstract class Animal {
    public $type; 
    public $name; 
    public $number_of_legs; 
    public $body_color; 

    abstract public function animal_speak() ;
}


class Dog extends Animal { 
 public function __construct($type, $name, $number_of_legs,$body_color ){
    $this->type = $type;
    $this->name = $name;
    $this->number_of_legs= $number_of_legs;
    $this->body_color = $body_color;
 }

 public function animal_speak() {
    echo "Woof, Woof"; 
 }
}
class Duck extends Animal { 
 public function __construct($type, $name, $number_of_legs,$body_color ){
    $this->type = $type;
    $this->name = $name;
    $this->number_of_legs= $number_of_legs;
    $this->body_color = $body_color;
 }

 public function animal_speak() {
    print "Baak, Baak"; 
 }
}
$reko = new Dog("golden", "reko", "4","golden" );  
$batoot = new Duck("seaDuck", "batoot", "2","white" );  
$reko->animal_speak(); 
$batoot->animal_speak(); 


?>