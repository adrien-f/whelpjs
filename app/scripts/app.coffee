'use strict'

angular.module('whelpjsApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'btford.socket-io',
  'ui.unique'
])
  .config ($routeProvider, socketProvider) ->
    socket = io.connect('127.0.0.1:9001/kills')
    socketProvider.ioSocket(socket)
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'
  .filter 'reverse', () ->
    return (items) ->
      return items.slice().reverse()
