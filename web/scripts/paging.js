// create the module
var routing = angular.module('myApp', ['ngRoute']);

// configure our routes
// routing.config(function($routeProvider) {
//     $routeProvider
//
//     // route for the home page
//         .when('/', {
//             templateUrl: 'pages/index.html',
//             controller: 'main'
//         })
//
//         // route for the properties page
//         .when('/properties', {
//             templateUrl: 'pages/properties.html',
//             // controller: 'properties'
//         })
//
//         // route for the about page
//         .when('/houses', {
//             templateUrl: 'pages/houses.html',
//             // controller: 'houses'
//         })
//
//         // route for the about page
//         .when('/vendors', {
//             templateUrl: 'pages/vendors.html',
//             // controller: 'vendors'
//         })
//
//         // route for the contact page
//         .when('/people', {
//             templateUrl: 'pages/people.html',
//             // controller: 'people'
//         })
//
//         // route for the about page
//         .when('/zone', {
//         templateUrl: 'pages/zone.html',
//         // controller: 'zone'
//     });

    routing.controller('main', function ($scope) {
        $scope.header = {name: "index.html", url: "index.html"};

        // $scope.test = function () {
        //     console.log('clicked');
        // }
    });

});