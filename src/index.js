var gpio = require('pi-gpio');

// set up pins
gpio.open(17, 'output', function(err) {
  console.log('Pin 17 open');
});
gpio.open(18, 'output', function(err) {
  console.log('Pin 17 open');
});
gpio.open(27, 'output', function(err) {
  console.log('Pin 17 open');
});
gpio.open(22, 'output', function(err) {
  console.log('Pin 17 open');
});

// var turn = setInterval(function() {
gpio.write(17, 1, function() {
  setTimeout(function() {
    gpio.write(17, 0);
    gpio.write(18, 1);
    setTimeout(function() {
      gpio.write(18, 0);
      gpio.write(27, 1);
      setTimeout(function() {
        gpio.write(27, 0);
        gpio.write(22, 1);
        setTimeout(function() {
          gpio.write(22, 0);
          // recursive call
        } ,100)
      } ,100)
    } ,100)
  }, 100);
});
