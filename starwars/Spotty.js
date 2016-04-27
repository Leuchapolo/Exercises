$(document).ready(function(){
	var tacos = "Delicious"; 
	$('#searchBut').click(function(event){
		event.preventDefault();
		var name = $('.artist-name').val().replace(/ /i, "+");
		$.ajax({
			url: "https://api.spotify.com/v1/search?q=" + name + "&type=artist",
			success: showArtistResults,
			error: function(error){
				console.log(error.responseJSON());
			}
		})
	})

	


});

function showArtistResults(data){
	$('.you-fool').toggle();

	data.artists.items.forEach(function(artist){
		var li = '<li> <button type = "submit" class = "art-butt" value = "' + artist.id + '">' + artist.name  + '</button>';
		if (artist.images[0])
		{
			li +=  '<br>' + '<img src = "' + artist.images[0].url + '" height = "400" width = "400">';
		} else {
			li += ': has no picture';
		}
		li += '</li>';
		$('.artist-list').append(li);
	})
	$('.art-butt').click(function(event){
		event.preventDefault();
		var id = event.currentTarget.value;
		event.currentTarget.append("id");

	})
}