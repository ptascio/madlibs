// $("#clear_form_button").on("click", function() {
//   $("#first_input").val("");
// });

var buttons;
var searcharea;
var showing = false;
function toggleSearchBar(){
  if (!showing){
    searcharea.style.display = "block";
    showing = true;
  }else {
    searcharea.style.display = "none";
    showing = false;
  }
}
//
document.addEventListener("DOMContentLoaded", () => {
  searcharea = document.getElementById("searcharea");
  buttons = document.getElementsByClassName("glyphicon");
  for (var i = 0; i < buttons.length; i++){
    buttons[i].addEventListener("click", toggleSearchBar);
  }
});
