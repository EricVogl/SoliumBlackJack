Hand = require('./hand')
Move = require('./move')

class Dealer
  hand: null

  constructor: ->
    @hand = new Hand

  nextMove: ->
    return Move.HIT if @hand.value() <= 16
    Move.STAND

module.exports = Dealer
