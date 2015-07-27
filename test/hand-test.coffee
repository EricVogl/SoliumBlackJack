chai = require 'chai'
chai.should()

Suit = require '../src/suit'
Card = require '../src/card'
Hand = require '../src/hand'

describe 'Hand instance', ->
  hand = new Hand
  shownCards = [new Card(Suit.CLUBS, 'A'),
                new Card(Suit.CLUBS, 2)]
  hiddenCards = [new Card(Suit.HEARTS, 3)]
  hand.addShownCard card for card in shownCards
  hand.addHiddenCard card for card in hiddenCards
  it 'should sum up the value of shown and hidden cards', ->
    hand.value().should.equal 16
  it 'should print only shown cards for toStringShownCards', ->
    hand.toStringShownCards().should.equal 'A\u2663,2\u2663'
  it 'should print both shown and hidden cards for toStringAllCards', ->
    hand.toStringAllCards().should.equal 'A\u2663,2\u2663,3\u2665'
  it 'should contain all the cards we added', ->
    hand.allCards().length.should.equal 3
    chai.expect(hand.allCards()).to.include card for card in shownCards
    chai.expect(hand.allCards()).to.include card for card in hiddenCards
