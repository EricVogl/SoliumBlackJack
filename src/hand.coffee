Card = require './card'

class Hand
  hiddenCards: null
  shownCards: null

  constructor: ->
    @hiddenCards = []
    @shownCards = []

  addHiddenCard: (card) ->
    @hiddenCards.push card

  addShownCard: (card) ->
    @shownCards.push card

  clearHand: ->
    @hiddenCards = []
    @shownCards = []

  value: ->
    sum = 0
    sum += card.value() for card in @shownCards
    sum += card.value() for card in @hiddenCards
    sum

  toStringShownCards: ->
    @shownCards.join(',')

  toStringAllCards: ->
    @allCards().join(',')

  allCards: ->
    allCards = []
    allCards.push card for card in @shownCards
    allCards.push card for card in @hiddenCards
    allCards

module.exports = Hand
