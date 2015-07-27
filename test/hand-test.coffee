chai = require 'chai'
chai.should()

Suit = require '../src/suit'
Card = require '../src/card'
Hand = require '../src/hand'

describe 'Hand instance', ->
  hand = new Hand
  shownCards = [new Card(new Suit('Clubs', 'c'), 'A'),
                new Card(new Suit('Clubs', 'c'), 2)]
  hiddenCards = [new Card(new Suit('Hearts', 'h'), 3)]
  hand.addShownCard card for card in shownCards
  hand.addHiddenCard card for card in hiddenCards
  it 'should sum up the value of shown and hidden cards', ->
    hand.value().should.equal 16
  it 'should print only shown cards for toStringShownCards', ->
    hand.toStringShownCards().should.equal 'Ac,2c'
  it 'should print both shown and hidden cards for toStringAllCards', ->
    hand.toStringAllCards().should.equal 'Ac,2c,3h'
  it 'should contain all the cards we added', ->
    hand.allCards().length.should.equal 3
    chai.expect(hand.allCards()).to.include card for card in shownCards
    chai.expect(hand.allCards()).to.include card for card in hiddenCards
