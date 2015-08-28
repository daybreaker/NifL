@Game = React.createClass
  findTeam: (id) ->
    _.find this.props.teams, (team) ->
      team.id == id

  homeTeam: ->
    team = this.findTeam(this.props.game_info.home_team_id)
    team.abbr

  awayTeam: ->
    team = this.findTeam(this.props.game_info.away_team_id)
    team.abbr

  render: ->
    `<div className="game">
      {this.homeTeam()} vs. {this.awayTeam()}
    </div>`
