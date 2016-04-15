// var fs = require('fs');
// function fileActions(err, file){ 
//     if (err) {
//         throw err;
//     }
//     var episodes = JSON.parse(file);
//     var sortedShows = episodes.sort(function(a,b){
//     		return a.episode_number - b.episode_number
//     }).filter(function(episode){
//         return episode.rating >= 8.5;
//     });



//     for (var i = 0;  i < sortedShows.length; i++){
    	


//     		console.log("Title: " + sortedShows[i].title + " #: " + sortedShows[i].episode_number)
//     		console.log(sortedShows[i].description);
//     		var stars = "";

//     		for (var j = 0; j <= sortedShows[i].rating; j++){
//     		stars += "*";
// 	    	}
// 	    	console.log("Rating: " + sortedShows[i].rating + " " + stars);


//     }
// }
// var rating = function(){

// }

// fs.readFile("got.json", 'utf8', fileActions);

function startAt(x)
{
    function incrementBy(y){
       return x + y
    }
   return incrementBy
}
   

var closure1 = startAt(1)(3)
var closure2 = startAt(5)(3)

console.log("closure1 " + closure1 + " closure2 " + closure2)
