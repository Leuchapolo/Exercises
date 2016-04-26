$(document).on("ready", function(){
	$('.fade-button').on('click', function(){
		$('body > * ').not('.fade-button').fadeToggle()
	});
	$('.uni-button').on('click', function(){
		$('*').toggleClass("unicorn-mode")
	});


})
