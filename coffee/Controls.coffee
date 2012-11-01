require.define 'spacetrip/controls': (require, exports, module) ->
    event = require 'gamejs/event'

    class Controls
        constructor: ->
            @up = false
            @down = false
            @right = false
            @left = false
            @fire = false

        handle: (e) =>
            if e.type is event.KEY_DOWN
                if e.key is event.K_UP
                    @up = true
                else if e.key is event.K_DOWN
                    @down = true
                else if e.key is event.K_RIGHT
                    @right = true
                else if e.key is event.K_LEFT
                    @left = true
                else if e.key is event.K_SPACE
                    @fire = true

            else if e.type is event.KEY_UP
                if e.key is event.K_UP
                    @up = false
                else if e.key is event.K_DOWN
                    @down = false
                else if e.key is event.K_RIGHT
                    @right = false
                else if e.key is event.K_LEFT
                    @left = false
                else if e.key is event.K_SPACE
                    @fire = false

        getAngle: ->
            if @up
                Math.PI * 1.5
            else if @down
                Math.PI * 0.5

    exports.Controls = Controls
