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

  showAllCards: ->
    @addShownCard @hiddenCards.pop() until @hiddenCards.length is 0
    @hiddenCards = []

  clearHand: ->
    @hiddenCards = []
    @shownCards = []

  value: ->
    nonAceSum = 0
    allCards = @allCards()
    isAce = (card) ->
      card.rank is 'A'
    notAce = (card) ->
      card.rank isnt 'A'
    nonAceSum += card.value() for card in allCards.filter notAce
    sumOptions = [nonAceSum]
    for card in allCards.filter isAce
      newSumOptions = []
      for value in sumOptions
        newSumOptions.push value + card.value()
        newSumOptions.push value + card.lowValue()
      sumOptions = newSumOptions
    minValue = Math.min sumOptions...
    return minValue if minValue > 21
    lessThanOrEqualTo21 = (value) ->
      value <= 21
    Math.max (sumOptions.filter lessThanOrEqualTo21)...

  isNatural: ->
    @allCards().length is 2 and @value() is 21

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
