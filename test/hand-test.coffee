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
  it 'should use the low value of an ace when the high value would put the hand over 21', ->
    hand = new Hand
    shownCards = [new Card(Suit.CLUBS, 'A'),
                  new Card(Suit.HEARTS, 'K'),
                  new Card(Suit.SPADES, '2')]
    hand.addShownCard card for card in shownCards
    hand.value().should.equal 13
  it 'should have a value of 13 with three aces', ->
    hand = new Hand
    shownCards = [new Card(Suit.CLUBS, 'A'),
                  new Card(Suit.HEARTS, 'A'),
                  new Card(Suit.SPADES, 'A')]
    hand.addShownCard card for card in shownCards
    hand.value().should.equal 13
  it 'should have a value of 14 with four aces', ->
    hand = new Hand
    shownCards = [new Card(Suit.CLUBS, 'A'),
                  new Card(Suit.HEARTS, 'A'),
                  new Card(Suit.SPADES, 'A'),
                  new Card(Suit.DIAMONDS, 'A')]
    hand.addShownCard card for card in shownCards
    hand.value().should.equal 14
  it 'should be a natural when Ace and a card with value of 10', ->
    hand = new Hand
    shownCards = [new Card(Suit.CLUBS, 'A'),
                  new Card(Suit.HEARTS, 'K')]
    hand.addShownCard card for card in shownCards
    hand.isNatural().should.be.ok
  it 'should not be a natural when value of 21 is reached any other way', ->
    hand = new Hand
    shownCards = [new Card(Suit.CLUBS, '3'),
                  new Card(Suit.HEARTS, 'K'),
                  new Card(Suit.DIAMONDS, '8')]
    hand.addShownCard card for card in shownCards
    hand.isNatural().should.be.notOk
  it 'should not crash when showing an empty hand', ->
    hand = new Hand
    hand.showAllCards()
    hand.shownCards.should.be.empty
  it 'should show all cards when showing a hand', ->
    hand = new Hand
    startedShown = new Card(Suit.CLUBS, '10')
    hand.addShownCard startedShown
    startedHidden1 = new Card(Suit.CLUBS, '6')
    startedHidden2 = new Card(Suit.CLUBS, '3')
    hand.addHiddenCard startedHidden1
    hand.addHiddenCard startedHidden2
    hand.showAllCards()
    hand.shownCards.length.should.equal 3
    chai.expect(hand.shownCards).to.include startedShown
    chai.expect(hand.shownCards).to.include startedHidden1
    chai.expect(hand.shownCards).to.include startedHidden2
