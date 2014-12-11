$(document).ready(function() {
  var timeStarted = false;
  var timeEnded = false;
  var start;
  var timer;

  $(document).on('keyup', function(e) {
    if (timeStarted == false)
     {
        start = $.now();
        updateTime();
        timeStarted = true;
      };
    var key = e.which
      if(key == 81)
       { // Q pressed
        $("#player1_strip td.active").next().addClass("active");
      }
      else if (key == 80)
       { // P was pressed
        $("#player2_strip td.active").next().addClass("active");
      };

      $("td.active").prev().removeClass("active");

      if($("#player1_strip td").last().hasClass("active"))
       {
        timeEnded = true;
        done(document.getElementById("player1").innerHTML);
        }
      else if ($("#player2_strip td").last().hasClass("active"))
       {
        timeEnded = true;
        done(document.getElementById("player2").innerHTML);
      };
  });

  var total_time;
    function updateTime() {
      var end = $.now();
     total_time = end - start;
      document.getElementById("time").innerHTML = total_time/1000;
      if (timeEnded == false)
      {
        timer = setTimeout(updateTime,10);
      }
      else
      {
        clearTimeout(timer);
      };


};

    function done(player) {
    $.ajax({
      type: "POST",
      url: "/finish",
      data: {time: total_time/1000, winner: player},
      success: function(data) {
        $("body").html(data);
      }
    });

  }

});