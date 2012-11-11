require.define 'spacetrip/spacecraft': (require, exports, module) ->
    gamejs = require 'gamejs'
    sprite = require 'gamejs/sprite'
    image = require 'gamejs/image'
    transform = require 'gamejs/transform'
    math = require 'gamejs/utils/math'

    MAX_SPEED = 350

    class Spacecraft extends sprite.Sprite
        constructor: (options) ->
            super

            @angle = 0
            @speed = 0

            @image = @originalImage = image.load 'assets/images/spacecraft.png'
            @rect = new gamejs.Rect options.x - @image.getSize()[0] / 2, options.y

            @controls = options.controls

        update: (msDuration) ->
            @_updateControls()

            @rect.moveIp [
                Math.sin(math.radians @angle) * @speed * (msDuration / 1000),
                -Math.cos(math.radians @angle) * @speed * (msDuration / 1000)
            ]

            @image = transform.rotate(@originalImage, @angle)

            @_updateLogs()

        _updateControls: ->
            if @controls.right
                @angle = math.normaliseDegrees @angle + 2.5

            if @controls.left
                @angle = math.normaliseDegrees @angle - 2.5

            if @controls.up
                @speed += 5

                if @speed > MAX_SPEED
                    @speed = MAX_SPEED

            if @controls.down
                @speed -= 10

                if @speed < 0
                    @speed = 0

        _updateLogs: ->
            console.log "Speed: #{ @speed }"
            console.log "Angle: #{ @angle }"

            console.log "X: #{ @rect.x }"
            console.log "Y: #{ @rect.y }"

    exports.Spacecraft = Spacecraft
