$(document).ready(function(){
	$.ajax({
		url: "https://ironhack-characters.herokuapp.com/characters",
		success: displayList,
		error: function(error){
			console.log(error.responseJSON);
		}

	})

	$('.formy').submit(function(event){
		event.preventDefault();
		var name = $('#name').val();
		console.log(name);

	})



	function displayList(data){
		data.forEach( function(char){
			var new_char = "<li>" + char.name + "</li>";
			$('.char-list').append(new_char);
		});
	}
})