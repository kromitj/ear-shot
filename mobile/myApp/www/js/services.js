angular.module('starter.services', [])

.factory('Songs', function($http, $q, $cordovaGeolocation) {
  var deferred = $q.defer();
  return {
    list: function(){
      var posOptions = {timeout: 10000, enableHighAccuracy: false};
        return $cordovaGeolocation
          .getCurrentPosition(posOptions)
          // console.log($cordovaGeolocation.getCurrentPosition());
          // console.log(.getCurrentPosition(posOptions))
          .then(function(position) {
            // hello = (position.coords.latitude)
          lat = position.coords.latitude
          long = position.coords.longitude
          return $http.get("http://localhost:3000/requests?lat="+lat+"&long="+long).then(function (data) {
            // console.log(long);
            return data.data;
           });
          });
          // console.log(hello)

    }
  };
})
.filter('trusted', ['$sce', function ($sce) {
    return function(url) {
        return $sce.trustAsResourceUrl(url);
    };
}])
.factory('UserSession', function($http, $resource) {
  return {
    userInfo: function(data){
      var username = (data.name);
      var password = (data.password);
      return $http({
      url: "http://localhost:3000/mobile",
      method: "POST",
      params: {username, password }
    }).success(function(data) {
      window.localStorage['userId'] = data.id;
      window.localStorage['username'] = data.username;
      $location.path('/tab/dash');
      });
    }
  };
})

.factory('Comment', function($http, $location){
  return {
    addComment: function(comment, song, user){
      var content = comment.name;
      // console.log(content)
      // console.log(comment)
      // console.log(user)
      return $http({
        url:"http://localhost:3000/comments",
        method: "POST",
        params: {content, song, user}
      }).success(function(data){
        $location.path('/tab/dash')
      });
    }
  };
})

.factory('Chats', function() {
  var chats = [{
    id: 0,
    name: 'Ben Sparrow',
    lastText: 'You on your way?',
    face: 'img/ben.png'
  }, {
    id: 1,
    name: 'Max Lynx',
    lastText: 'Hey, it\'s me',
    face: 'img/max.png'
  }, {
    id: 2,
    name: 'Adam Bradleyson',
    lastText: 'I should buy a boat',
    face: 'img/adam.jpg'
  }, {
    id: 3,
    name: 'Perry Governor',
    lastText: 'Look at my mukluks!',
    face: 'img/perry.png'
  }, {
    id: 4,
    name: 'Mike Harrington',
    lastText: 'This is wicked good ice cream.',
    face: 'img/mike.png'
  }];

  return {
    all: function() {
      return chats;
    },
    remove: function(chat) {
      chats.splice(chats.indexOf(chat), 1);
    },
    get: function(chatId) {
      for (var i = 0; i < chats.length; i++) {
        if (chats[i].id === parseInt(chatId)) {
          return chats[i];
        }
      }
      return null;
    }
  };
});
