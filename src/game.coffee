Deck = require './deck'
Dealer = require './dealer'
Player = require './player'

class Game
  dealer: new Dealer
  players: []
  deck: new Deck

  addPlayer: (player) ->
    players.push player

  start: () ->    
    dealer.hand.addHiddenCard deck.nextCard
    dealer.hand.addShownCard deck.nextCard

    for player in players
      player.onGameEnd() if player.chips <= 0
      player.getBet()
      dealer.dealCard deck.nextCard

mode.exports = Game
