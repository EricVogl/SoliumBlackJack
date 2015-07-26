Card = require './card'

class Hand
  hiddenCards: []
  shownCards: []

  addHiddenCard: (card) ->
    @hiddenCards.push card

  addShownCard: (card) ->
    @shownCards.push card

  value: ->
    sum = 0
    sum += card.value() for card in @hiddenCards
    sum += card.value() for card in @shownCards
    sum

module.exports = Hand
