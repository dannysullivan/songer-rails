angular.module('songer').controller 'RhythmsCtrl', ->
  randomRhythm = ->
    values = ['x', '.']

    rhythm = ""
    for i in [0..7]
      index = Math.floor(Math.random()*2)
      rhythm = rhythm + values[index]
    rhythm

  controller = @

  controller.rhythms = []
  controller.createRhythm = ->
    rhythm = randomRhythm()
    while rhythm in controller.rhythms
      rhythm = randomRhythm()
    controller.rhythms.push rhythm 
  controller
