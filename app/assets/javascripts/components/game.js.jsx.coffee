@Game = React.createClass
  render: ->
    `<div>
      <div>{this.props.away_team.abbr} @ {this.props.home_team.abbr}</div>
    </div>`
