require.define 'spacetrip/main': (require, exports, module) ->
    gamejs = require 'gamejs'
    display = require 'gamejs/display'
    image = require 'gamejs/image'
    time = require 'gamejs/time'
    event = require 'gamejs/event'

    Spacecraft = require('spacetrip/spacecraft').Spacecraft
    Controls = require('spacetrip/controls').Controls
    Space = require('spacetrip/space').Space

    main = ->
        console.log 'Loading ...'

        display.setMode [800, 600]

        surface = display.getSurface()

        player = new Spacecraft {
            x: surface.getSize()[0] / 2,
            y: surface.getSize()[1] / 2,
            controls: new Controls
        }

        space = new Space

        tick = (msDuration) ->
            event.get().forEach(player.controls.handle)

            # Update background
            space.update msDuration
            space.draw surface

            # Update player
            player.update msDuration
            player.draw surface

        time.fpsCallback tick, this, 25

    gamejs.preload [
        'assets/images/background.png',
        'assets/images/spacecraft.png'
    ]

    gamejs.ready main
