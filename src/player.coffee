Hand = require('./hand')

class Player
  chips: 0
  hand: new Hand
  onGameEnd: ->

  getBet: ->

  dealCard: (card) ->
    hand.addShownCard card

module.exports = Player
