@Week = React.createClass
  showGames: ->
    _.map this.props.games, (game) ->
      `<Game
        game_info={game.game_info}
        teams={game.teams}
      />`

  render: ->
    `<div>
      {this.showGames()}
    </div>`
