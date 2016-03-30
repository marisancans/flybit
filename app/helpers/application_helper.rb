module ApplicationHelper

   def remote_request(type, path, params={}, target_tag_id)
    "$.#{type}('#{path}',
               {#{params.collect { |p| "#{p[0]}: #{p[1]}" }.join(", ")}},
               function(data) {$('##{target_tag_id}').html(data);}
     );"
  end

	def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end


	
end
