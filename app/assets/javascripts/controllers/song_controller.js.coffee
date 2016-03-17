angular.module('songer').controller 'SongCtrl', ->
  controller = @

  controller.createPattern = (numberOfMeasures, rhythm1, rhythm2) ->
    rhythms = [rhythm1, rhythm2]
    controller.measures = []

    for i in [0...numberOfMeasures]
      index = Math.floor(Math.random()*rhythms.length)
      controller.measures.push(rhythms[index])

    controller.pattern = controller.measures.join('')

  controller
