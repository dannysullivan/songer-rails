angular.module('songer').controller 'SongCtrl', ->
  controller = @

  controller.createArrangement = (numberOfMeasures) ->
    rhythms = [controller.rhythm1, controller.rhythm2]
    controller.arrangement = []

    for i in [0...numberOfMeasures]
      index = Math.floor(Math.random()*rhythms.length)
      controller.arrangement.push(rhythms[index])

  controller
