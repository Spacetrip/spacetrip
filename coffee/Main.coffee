require.define 'spacetrip/main': (require, exports, module) ->
    gamejs = require 'gamejs'
    display = require 'gamejs/display'
    image = require 'gamejs/image'
    time = require 'gamejs/time'
    event = require 'gamejs/event'

    spacetrip = require 'spacetrip'

    main = ->
        console.log 'Loading ...'

        display.setMode [800, 600]

        surface = display.getSurface()
        surface.blit image.load 'assets/images/background.png'

        player = new spacetrip.Spacecraft surface.getSize()[0] / 2, surface.getSize()[1] / 2

        tick = (msDuration) ->
            player.update msDuration
            player.draw surface

        time.fpsCallback tick, this, 25

    gamejs.preload [
        'assets/images/background.png',
        'assets/images/spacecraft.png'
    ]

    gamejs.ready main
