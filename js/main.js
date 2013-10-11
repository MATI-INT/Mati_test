$(document).ready(function() {
	$('#content').find('h1').css('color', 'red');
	
	$('img').on('click', function() {
			$('nav').replaceWith('<div>TEST</div>');
			$('#content').after('<p>INSERTED TEXT</p>');
	});
	
	$('a').on('click', function(target) {
		target.preventDefault();
	});
});

