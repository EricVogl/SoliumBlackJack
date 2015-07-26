chai = require 'chai'
chai.should()
Card = require '../src/card'

describe 'Card instance', ->
  card = null
  it 'should have a suit', ->
    card = new Card('\u2660','A')
    card.suit.should.equal '\u2660'
