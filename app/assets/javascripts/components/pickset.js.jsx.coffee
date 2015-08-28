@Pickset = React.createClass
  render: ->
    `<div>
      <Season
        year={this.props.pickset_season.season.year}
        weeks={this.props.pickset_season.weeks}
      />
    </div>`
