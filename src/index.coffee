# see: http://www.sundh.com/blog/2014/02/control-stepper-motors-with-raspberry-pi-and-node-js/

gpio = require('pi-gpio')



#
class Motor

  #
  constructor: ->
    @stopped = false
    @_init()

  #
  _init: ->
    gpio.open 16, 'output', (err) -> # open pin 16 as output
      console.log 'Pin 16 open'
    gpio.open 18, 'output', (err) -> # open pin 18 as output
      console.log 'Pin 18 open'

  #
  sleep: (milliseconds) ->
    start = (new Date).getTime()
    i = 0
    while i < 1e7
      if (new Date).getTime() - start > milliseconds
        break
      i++
    return

  # run motor in the set direction
  move: ->
    gpio.write 16, 1, =>
      @sleep(1000)
      gpio.write 16, 0, =>
        @sleep(1000)
        if !@stopped
          @move()

  # stop motor
  stop: ->
    @stopped = true

  # change direction of motor
  left: ->
    @stopped = false
    gpio.write 18, 1, =>
      @move()

  # change direction of motor
  right: ->
    @stopped = false
    gpio.write 18, 0, =>
      @move()



# kickoff
motor = new Motor
motor.move()
