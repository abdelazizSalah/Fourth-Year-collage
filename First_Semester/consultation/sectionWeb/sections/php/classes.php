
<?php
    // define a car class
    class Car {
        public $color; 
        public $type; 

        function __construct($color, $type) { 
            $this->color = $color;
            $this->type = $type;
        }

        function print_car () {
            echo "The color of this car is: $this->color and the type is $this->type";
        }
    }
$car = new Car("Green","BMW");
$car->print_car();
?>