@nifl.controller 'SeasonsShowController', ['$scope', '$location', '$http', '$routeParams', ($scope, $location, $http, $routeParams) ->
  
  $scope.season = []
  $scope.tabs = []

  $http.get("./seasons/#{$routeParams.id}.json").success((data) ->
    $scope.season = data.season
    $scope.tabs.push {number: week.week.number, games: week.games} for week in data.weeks
    console.log $scope.tabs
  )

  $scope.makePick = (game_id, team_id) ->
    console.log(team_id)
    console.log(game_id)
    $http.post("picks", {game_id: game_id, team_id: team_id})
]
