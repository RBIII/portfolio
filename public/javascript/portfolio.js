function showMenu() {
  $('#dropdown-menu').css('margin-bottom', '22%');

  $('#small-screen-menu').slideDown(function() {
    $('#close-menu-image').show();
    $('#menu-image').hide();
  });
}

function hideMenu() {
  $('#small-screen-menu').slideUp(function() {
    $('#dropdown-menu').css('margin-bottom', '0');

    $('#close-menu-image').hide();
    $('#menu-image').show();
  });
}

if(document.querySelector(".carouselbox") != null) {
  carousel = (function(){
    var box = document.querySelector(".carouselbox");
    var next = box.querySelector(".next");
    var prev = box.querySelector(".prev");
    var items = box.querySelectorAll(".content li");
    var counter = 0;
    var amount = items.length;
    var current = items[0];
    box.classList.add("active");

    function navigate(direction) {
      current.classList.remove("current");
      counter = counter + direction;

      if (direction = -1 && counter < 0) {
        counter = amount - 1;
      }
      if (direction = 1 && !items[counter]) {
        counter = 0;
      }

      current = items[counter];
      current.classList.add("current");
    }

    next.addEventListener("click", function(ev) {
    navigate(1);
    });
    prev.addEventListener("click", function(ev) {
    navigate(-1);
    });
    navigate(0);
  })();
}
