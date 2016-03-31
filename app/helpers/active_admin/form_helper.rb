module ActiveAdmin::FormHelper

	def remote_get(path, member,target_tag_id)
	 "$.get('#{path}/?#{member}=' + $('##{member}').val(),
	     function(data) {$('##{target_tag_id}').html(data);}
	   );"
	end

end