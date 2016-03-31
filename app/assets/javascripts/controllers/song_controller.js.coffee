angular.module('songer').controller 'SongCtrl', ['$scope', 
  ($scope) ->
    controller = @

    incrementIndex = ->
      controller.syllableIndex += 1
      word = $($('.word')[controller.wordIndex])
      if controller.syllableIndex == word.data('syllables')
        controller.wordIndex += 1
        controller.syllableIndex = 0
        $('.word.mark').removeClass('mark')
        $($('.word')[controller.wordIndex]).addClass('mark')

    controller.startPlayback = ($event, midiUrl) ->
      $($event.currentTarget).button('loading')
      $('.word.mark').removeClass('mark')
      $($('.word')[0]).addClass('mark')
      controller.syllableIndex = -1
      controller.wordIndex = 0
      MIDI.loadPlugin
        soundfontUrl: "../soundfonts/",
        instrument: "acoustic_grand_piano",
        onprogress:((state, progress) ->
          console.log(state, progress)
        ),
        onsuccess: ->
          $($event.currentTarget).button('reset')
          player = MIDI.Player
          player.addListener (data) ->
            if data.message == 144
              if data.note > 50
                incrementIndex()
          player.loadFile midiUrl, player.start
    controller
]
