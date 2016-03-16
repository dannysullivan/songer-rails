angular.module('songer').controller 'NewSongCtrl', ->
  createRhythm = ->
    values = ['x', '.']

    rhythm = ""
    for i in [0..7]
      index = Math.floor(Math.random()*2)
      rhythm = rhythm + values[index]
    rhythm

  controller = @

  controller.createArrangement = (numberOfMeasures) ->
    rhythms = [controller.rhythm1, controller.rhythm2]
    controller.arrangement = []

    for i in [0...numberOfMeasures]
      index = Math.floor(Math.random()*rhythms.length)
      controller.arrangement.push(rhythms[index])

    controller.pattern = controller.arrangement.join('')

  controller.createRhythms = ->
    controller.rhythm1 = createRhythm()
    controller.rhythm2 = createRhythm()

  controller
