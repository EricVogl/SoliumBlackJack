chai = require 'chai'
chai.should()
Suit = require '../src/suit'

describe 'Suit instance', ->
  it 'should be able to look up symbol', ->
    suit = Suit.SPADES
    suit.should.equal '\u2660'
