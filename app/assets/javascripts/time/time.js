function appendZero(num) {
        if (num === 0) {
          return 12;
      } else if (num > 12){
          return (num - 12);
      } else {
        return num;
      }};
function appendSingle(num) {
        if (num < 10) {
          return ("0" + num);
        } else {
          return num;
      }};
      function pm(num) {
              if (num >= 12) {
                return ("PM");
              } else {
                return ("AM");
            }};
  function displayC() {
  var refresh=1000; // Refresh rate in milli seconds
  setTimeout('displayTime()',refresh)
};
  function displayTime() {
  var now = new Date();
  var dayNames = new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
  var monNames = new Array("January","February","March","April","May","June","July","August","September","October","November","December");
  var showDate = ("Hello,   " +  dayNames[now.getDay()] + " " + monNames[now.getMonth()] + " " + now.getDate() + ", " + now.getFullYear());
  var showNow = ( showDate + " " + appendZero(now.getHours()) + " : " + appendSingle(now.getMinutes()) + " : " + appendSingle(now.getSeconds()) +" "+ pm(now.getHours()));
  document.getElementById('ct').innerHTML = showNow;
  displayC();
 };

  $(function() {
  $('.flash').delay(2500).fadeOut(1000);
});
