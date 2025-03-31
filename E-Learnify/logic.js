// Select the toggle button
const themeToggle = document.getElementById('theme-toggle');

// Add event listener to toggle dark mode
themeToggle.addEventListener('click', () => {
  // Toggle the dark mode class on the body element
  document.body.classList.toggle('dark-mode');
  
  // Update the button icon based on the mode
  if (document.body.classList.contains('dark-mode')) {
    themeToggle.textContent = '☀️'; // Light mode icon
  } else {
    themeToggle.textContent = '🌙'; // Dark mode icon
  }
});

window.onload = function() {
    window.scrollTo(0, 0);
};

const typingTextElement= document.getElementById("sub-text");
const fullText= typingTextElement.textContent;
typingTextElement.textContent="";

let index=0;

function typeletter(){
    if(index < fullText.length){
        typingTextElement.textContent += fullText[index];
        index++;
        setTimeout(typeletter,20);
    }
}

typeletter();

//login botton

document.addEventListener("DOMContentLoaded", (event) =>{
  var regexpforname = (/^[A-z]+$/);
	var regexforemail = (/^[a-zA-Z]+[a-zA-Z0-9._]+@[a-zA-Z]+\.[a-zA-Z]{2,6}$/);
  var form = document.getElementById("loginform");
  var btn= document.getElementById("loginBtn");

  btn.onclick = function(){
    form.style.display = "block";
  }

  span.onclick = function(){
    form.style.display = "none";
  }

  window.onclick = function(event){
    if(event.target == modal){
      form.style.display = "none";
    }
  };

});