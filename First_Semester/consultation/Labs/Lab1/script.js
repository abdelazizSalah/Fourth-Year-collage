function validateForm() {
  let username = document.getElementById("username").value;
  let password = document.getElementById("password").value;
  let retypedPassword = document.getElementById("retypedPassword").value;
  let age = document.getElementById("age").value;
  let accountType = document.getElementById("account").value;

  let passwordError = document.getElementById("passwordError");
  let retypedPasswordError = document.getElementById("retypedPasswordError");
  let ageError = document.getElementById("ageError");

  let teachingId = "";

  const regex = /^(?=.*\d)(?=.*[A-Z]).+$/;

  // 1-Empty
  if (
    username === "" ||
    password === "" ||
    retypedPassword === "" ||
    age === ""
  ) {
    alert("All fields must be filled");
    return false;
  }

  // 2-Password Length
  else if (password.length < 8) {
    passwordError.innerText = "A password should be at least 8 characters";
    passwordError.style.display = "block";
    return false;
  }

  // 3-Password Strength
  else if (!regex.test(password)) {
    passwordError.innerText =
      "A password should include at least one uppercase character and one numeric digit";
    passwordError.style.display = "block";
    return false;
  }

  // 4-Retyped Password Don't Match
  else if (password !== retypedPassword) {
    retypedPasswordError.innerText = "The two passwords do not match";
    retypedPasswordError.style.display = "block";
    return false;
  }

  // 5-Age is Less than 18
  else if (age < 18) {
    ageError.innerText = "You should be at least 18 years old to sign up";
    ageError.style.display = "block";
    return false;
  }

  // 6-Check for account type
  else if (accountType === "professor" && age < 30) {
    alert("You must be 30 years or above to register as professor");
    return false;
  }

  // if we reached here so the validations were successful

  // 7-Check if student
  if (accountType === "student") {
    alert(`Hello, ${username} \n You are successfully registered as: Student`);
    localStorage.setItem("username", username);
    localStorage.setItem("account", accountType);
    return true;
  }

  // If professor or teaching assistant
  else if (accountType === "professor" || accountType === "teachingAssistant") {
    teachingId = window.prompt("Enter your teaching ID:");
    if (teachingId !== null) {
      localStorage.setItem("username", username);
      localStorage.setItem("account", accountType);
      localStorage.setItem("teachingId", teachingId);
      return true;
    }
  }

  passwordError.innerText = "";
  retypedPasswordError.innerText = "";
  ageError.innerText = "";
  return true;
}

function onSubmitHandler() {
  let result = validateForm();

  return result;
}
