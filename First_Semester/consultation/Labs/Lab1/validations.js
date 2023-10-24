function onSubmit(e) {
    // prevent the refresh behaviour
    // document.getElementById('myForm').addEventListener('submit', function(e){
    //     e.preventDefault();
    // });
    
    // 1. select all inputs, and check if they are empty 
   for (let input of document.querySelectorAll('input')) {
      if (input.value === '') {
         alert('Please fill out all fields');
         return false;
      }
   }
    //? 2
    if(document.querySelector('#pass1').value.length<8){    
        
        document.querySelector('#hiddenMsg3').style.display = 'none';
        document.querySelector('#hiddenMsg2').style.display = 'none';     
        document.querySelector('#hiddenMsg1').style.display = 'inline';
        return false; 
    }
    //? 3
//     - If the password is at least 8 characters but does not contain any number [0-9] 
// AND at least one uppercase letter, show the following error message in red next to 
// the text box of
    var pattern_1 = /[A-Z]/;
    var pattern_2 = /[0-9]/;
    if(
        !document.querySelector('#pass1').value.match(pattern_2) ||
        !document.querySelector('#pass1').value.match(pattern_1)
    ){
        document.querySelector('#hiddenMsg1').style.display = 'none';
        document.querySelector('#hiddenMsg3').style.display = 'none';
        
        document.querySelector('#hiddenMsg2').style.display = 'inline';
        return false;
    }
    //? 4
   if(document.querySelector('#pass1').value !== document.querySelector('#pass2').value){
      
    document.querySelector('#hiddenMsg2').style.display = 'none';     
    document.querySelector('#hiddenMsg1').style.display = 'none';
    document.querySelector('#hiddenMsg3').style.display = 'inline';
      return false;
   }
    //?5
    if(Number(document.querySelector('#Age').value )< 18){
        
        document.querySelector('#hiddenMsg2').style.display = 'none';     
        document.querySelector('#hiddenMsg1').style.display = 'none';
        document.querySelector('#hiddenMsg3').style.display = 'none';
        document.querySelector('#hiddenMsg4').style.display = 'inline';
        document.querySelector('#Age').value = 0; 
        return false; 
    }
    //? 6
    if(document.querySelector('#accounts').value == 'Professor' && Number(document.querySelector('#Age').value) < 30){
        alert("You must be 30 years or above to register as professor"); 
        return false;
    }
    //? 7 
    if (document.querySelector('#accounts').value == 'Student') {
        alert("Hello, "+ document.querySelector('#UserName').value.toUpperCase() +"\n\nYou have successfully registered as a student");
        localStorage.setItem("username", document.querySelector('#UserName').value);
    localStorage.setItem("account", document.querySelector('#accounts').value);
    return true; 
    }   else {
       // make a input text field in the alert 
      let teachingId = prompt("Enter Your Teaching ID: ");
      localStorage.setItem("username", document.querySelector('#UserName').value);
      localStorage.setItem("account", document.querySelector('#accounts').value);
      localStorage.setItem("teachingId", teachingId);
    //   e.preventDefault(false);
      return true; 
    }


}