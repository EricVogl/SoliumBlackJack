Deck = require './deck'
Dealer = require './dealer'
Player = require './player'

class Game
  dealer: new Dealer
  players: []
  deck: new Deck

  addPlayer: (player) ->
    @players.push player

  playRound: () ->
    for player in @players
      player.onGameEnd() if player.chips <= 0
      player.getBet()
      player.hand.addHiddenCard deck.nextCard

    @dealer.hand.addHiddenCard deck.nextCard

    player.hand.addShowCard deck.nextCard

    @dealer.hand.addShownCard deck.nextCard
    if @dealer.hand.isNatural()
      @dealer.hand.showAllCards()





mode.exports = Game
