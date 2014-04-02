var app = angular.module('PaySlip',[]);

app.controller("mainController", function($scope, $http){
    $scope.results = [];
    $scope.filterText = null;
    $scope.availableCategories = [];
    $scope.categoryFilter = null;
   
    $scope.init = function() {
    
    $http.jsonp('http://spreadsheets.google.com/feeds/list/0Ap3eV0cQL87mdC1Ndl9qUHRrelN2OXZVa3hyWjFHdGc/od6/public/values?alt=json-in-script' + '&callback=JSON_CALLBACK').success(function(data) {
        //console.log(data);

        angular.forEach(data, function(value, index){
                angular.forEach(value.entry, function(classes, index){
                    $scope.results.push(classes);
                    angular.forEach(classes.gsx$categorie, function(category, index){
                        var exists = false;
                        angular.forEach($scope.availableCategories, function(avCat, index){
                            if (avCat == category) {
                                exists = true;
                            }
                        });
                        if (exists === false) {
                            $scope.availableCategories.push(category);
   
                        }
                    }); 
                    
                });
                
            });
            
        }).error(function(error) {
 
        });

    };
    
    $scope.setCategoryFilter = function(category) {
    $scope.categoryFilter = category;
    
    }     

});
      



