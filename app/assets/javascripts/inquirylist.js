$(document).ready(function(){
	if($('table').is('#inquiry-table')){
		//console.log('jquery executing');
		$("#inquiry-submit-btn").click(function(){
			$(".edit_line_item").each(function(){
				$(this).submit();
			});
		});
	}
});