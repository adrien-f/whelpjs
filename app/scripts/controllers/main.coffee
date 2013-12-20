'use strict'

angular.module('whelpjsApp')
  .controller 'MainCtrl', ($scope, socket) ->
    socket.forward('update', $scope);
    $scope.killmails = []
    $scope.destroyed = 0.0
    $scope.lost = 0.0
    $scope.$on 'socket:update', (ev, data) ->
      $scope.killmails = $scope.killmails.concat(data.killmails)
      $scope.destroyed = data.stats.killed
      $scope.lost = data.stats.lost

    $scope.round = (number) ->
      return Math.round(number * 100) / 100

    $scope.addCommas = (number) ->
      return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")

