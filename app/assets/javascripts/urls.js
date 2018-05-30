/*
	All url related js over here
 */

$(document).ready(function() {

  $('#shorten-link').on('input', function(event) {
  	 var link = $('#shorten-link').val();
  	 if(link.length > 0)
  	 {
  	 	$('#shorten-link').removeClass('is-invalid');	
  		$("#shorten-input-err").text('');	
  	 }
  });	

  $('#shorten-generate').click(function(event) {
  		var link = $('#shorten-link').val();
  		if(link.length ==0)
  		{
  			$('#shorten-link').addClass('is-invalid');	
  			$("#shorten-input-err").text('Put some link to generate');
  		}
  		else
  		{
  			$('#shorten-generate').prop('disabled', true);
  			$('#shorten-generate').html('<i class="fa fa-circle-o-notch fa-spin"></i> Generating')
  			$.post( "/urls", {link: link}, function( data ) {
			  $('#shorten-generate').prop('disabled', false);
  			  $('#shorten-generate').html('Generate');
  			  $('#shorten-url').html('<b>abc</b>');
  			  $('#shorten-url-stats').html('<b><i class="fa fa-bar-chart"></i> stats</b>');
			});
  		}

  		
  });

 });

