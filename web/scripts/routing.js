/// <reference path="angular.min.js" />

var app = angular.module("caab",["ngRoute"]);

    app.config(function ($routeProvider) {
        $routeProvider
            .when('/', {
                templateUrl: 'pages/home.html',
                controller: 'mainController'
            })
            .when('/properties', {
                templateUrl: 'pages/properties.html',
                controller: 'propController'
            })
            .when('/houses', {
                templateUrl: 'pages/houses.html',
                controller: 'houseController'
            })
            .when('/people', {
                templateUrl: 'pages/people.html',
                controller: 'peopleController'
            })
            .when('/vendors', {
                templateUrl: 'pages/vendors.html',
                controller: 'vendorController'
            })
            .when('/zones', {
                templateUrl: 'pages/zones.html',
                controller: 'zoneController'
            })
    })
    .controller("mainController", function ($scope) {
        $scope.sortType     = 'name'; // set the default sort type
        $scope.sortReverse  = false;  // set the default sort order
        $scope.searchFish   = '';     // set the default search/filter term

        // create the list of sushi rolls
        $scope.sushi = [
            { name: 'Left Roll', fish: 'Crab', tastiness: 2 },
            { name: 'Pink', fish: 'Sushi', tastiness: 4 },
            { name: 'Lion', fish: 'Something', tastiness: 7 },
            { name: 'Rainbow', fish: 'Variety', tastiness: 6 }
        ];
    })
    .controller("propController", function ($scope) {
        $scope.sortType     = 'name'; // set the default sort type
        $scope.sortReverse  = false;  // set the default sort order
        $scope.searchFish   = '';     // set the default search/filter term

        // create the list of sushi rolls
        $scope.sushi = [
            { name: 'Cali', fish: 'Not even rolls', tastiness: 2 },
            { name: 'Philly', fish: 'Tuna', tastiness: 4 },
            { name: 'Black', fish: 'Eel', tastiness: 7 },
            { name: 'Rainbow', fish: 'Grey', tastiness: 6 }
        ];
    })
    .controller("houseController", function($scope) {
        $scope.sortType     = 'name'; // set the default sort type
        $scope.sortReverse  = false;  // set the default sort order
        $scope.searchFish   = '';     // set the default search/filter term

        // create the list of sushi rolls
        $scope.sushi = [
            { name: 'Cali Roll', fish: 'Crab', tastiness: 2 },
            { name: 'we', fish: 'Tuna', tastiness: 4 },
            { name: 'Tiger', fish: 'are', tastiness: 7 },
            { name: 'marshall', fish: 'Variety', tastiness: 6 }
        ];
    })
    .controller("peopleController", function($scope) {
        $scope.sortType     = 'name'; // set the default sort type
        $scope.sortReverse  = false;  // set the default sort order
        $scope.searchFish   = '';     // set the default search/filter term

        // create the list of sushi rolls
        $scope.sushi = [
            { name: 'I Roll', fish: 'Crab', tastiness: 2 },
            { name: 'Philly', fish: 'H', tastiness: 4 },
            { name: 'J', fish: 'Eel', tastiness: 7 },
            { name: 'Rainbow', fish: 'Variety', tastiness: 6 }
        ];
    })
    .controller("vendorController", function($scope) {
        $scope.sortType     = 'name'; // set the default sort type
        $scope.sortReverse  = false;  // set the default sort order
        $scope.searchFish   = '';     // set the default search/filter term

        // create the list of sushi rolls
        $scope.sushi = [
            { name: 'j', fish: 'S', tastiness: 2 },
            { name: 'a', fish: 'h', tastiness: 4 },
            { name: 'c', fish: 'i', tastiness: 7 },
            { name: 'k', fish: 't', tastiness: 6 }
        ];
    })
    .controller("zoneController", function ($scope) {
        $scope.sortType     = 'name'; // set the default sort type
        $scope.sortReverse  = false;  // set the default sort order
        $scope.searchFish   = '';     // set the default search/filter term

        // create the list of sushi rolls
        $scope.sushi = [
            { name: 'Cal', fish: 'Ripkin', tastiness: 2 },
            { name: 'Philly', fish: 'Tuna', tastiness: 4 },
            { name: 'J', fish: 'Eel', tastiness: 7 },
            { name: 'Rainbow', fish: 'H', tastiness: 6 }
        ];
    })



