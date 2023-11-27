# Cascade notes
* HTML elements can inherit CSS of their parents. 
* not all properties are inherited:
  * margin
  * padding
  * border
  * background
  * height
  * width
* to allow a child to inherit from his parent specific things, just define it using a selector in the css file, and chose the property you want and assign it to inherit value
  * ie: 
    * p {
      * margin: inherit;
      * padding: inherit; 
    * }