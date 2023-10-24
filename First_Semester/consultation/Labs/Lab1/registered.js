const username = localStorage.getItem("username");
const account = localStorage.getItem("account");
const teachingId = localStorage.getItem("teachingId");

// Get the elements to display the user's information
let registeredUserName = document.getElementById("registeredUserName");
let registeredAccount = document.getElementById("registeredAccount");
let teachingIdContainer = document.getElementById("teachingIdContainer");
let registeredTeachingId = document.getElementById("registeredTeachingId");

if (username) {
  registeredUserName.innerText = username;
}

if (account) {
  registeredAccount.innerText = account;
}

if (teachingId) {
  teachingIdContainer.style.display = "block";
  registeredTeachingId.innerText = teachingId;
}
