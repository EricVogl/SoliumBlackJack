chai = require 'chai'
chai.should()
Suit = require '../src/suit'
Card = require '../src/card'
Hand = require '../src/hand'

describe 'Handle instance', ->
  hand = null
  it 'should sum up the value of shown and hidden cards', ->
    hand = new Hand
    shownCards = [new Card(new Suit('Clubs', 'c'), 'A'),
                  new Card(new Suit('Clubs', 'c'), 2)]
    hiddenCards = [new Card(new Suit('Hearts', 'h'), 3)]
    hand.addShownCard card for card in shownCards
    hand.addHiddenCard card for card in hiddenCards
    hand.value().should.equal 16
