// Select the toggle button
const themeToggle = document.getElementById('theme-toggle');

themeToggle.addEventListener('click', () => {
  document.body.classList.toggle('dark-mode');
  
  // Update the button icon based on the mode
  if (document.body.classList.contains('dark-mode')) {
    themeToggle.textContent = '☀️'; 
  } else {
    themeToggle.textContent = '🌙'; 
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

document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("loginform");
  const btn = document.getElementById("loginBtn");
  const closeBtn = document.getElementById("closeBtn"); // Add close button with id="closeBtn"

  if (btn && form) {
      btn.onclick = function() {
          form.style.display = "block";
      };
  }

  if (closeBtn) {
      closeBtn.onclick = function() {
          form.style.display = "none";
      };
  }

  window.onclick = function(event) {
      if (event.target === form) {
          form.style.display = "none";
      }
  };
});