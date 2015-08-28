@Content = React.createClass
  render: ->
    `<div className="content">
      <Week
        number={this.props.currentTab}
        games={this.props.games}
      />
    </div>`

@Tab = React.createClass
  handleClick: (e) ->
    e.preventDefault()
    this.props.handleClick()

  render: ->
    `<li className={this.props.isCurrent ? 'current' : null}>
        <a onClick={this.handleClick} href={this.props.url}>
            {this.props.name}
        </a>
    </li>`

@Tabs = React.createClass
  handleClick: (tab) ->
    this.props.changeTab tab

  renderTabs: ->
    _this = this
    _.map this.props.tabList, (week) ->
      `<Tab
        handleClick={_this.handleClick.bind(this, week.week)}
        key={week.week.number}
        url={"week" + week.week.number}
        name={"WK " + week.week.number}
        isCurrent={(_this.props.currentTab === week.week.number)}
       />`

  render: ->
    `<nav>
       <ul>
         {this.renderTabs()}
       </ul>
    </nav>`


@Season = React.createClass
  getInitialState: ->
    {
      tabList: this.props.weeks,
      currentTab: 1
    }

  changeTab: (tab) ->
    this.setState { currentTab: tab.number }

  gamesForWeek: (week_num) ->
    week = _.find this.props.weeks, (week) ->
      week.week.number == week_num
    week.games

  render: ->
    `<div className="app">
      <h1>{this.props.year} Season</h1>

      <Tabs
        currentTab={this.state.currentTab}
        tabList={this.state.tabList}
        changeTab={this.changeTab}
      />
      <div className="clear" />
      <Content
        currentTab={this.state.currentTab}
        games={this.gamesForWeek(this.state.currentTab)}
      />
    </div>`
