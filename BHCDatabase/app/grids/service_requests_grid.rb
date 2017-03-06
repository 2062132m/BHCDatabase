class ServiceRequestsGrid

  include Datagrid

  scope do
    ServiceRequest
  end

  #
  # Columns
  #


  column(:user_id, :header => "User", :mandatory => true) do |model|

    format(model.user_id) do |value|
      unless value == nil
        link_to User.find(value).name, User.find(value)
    end
    end
    end
  column(:request, :mandatory => true)
  column(:created_at, :mandatory => true) do |model|
    format(model.created_at) do |value|
      value.strftime("%B %d, %Y - %H:%M")
    end
  end

 # column(:id, :header => "Delete", :mandatory => true) do |model|
 #  format(model.id) do |value|
 #     Area.find(value).name
 #   end
 # end



  #link_to "<i class='glyphicon glyphicon-trash'></i> Delete".html_safe, @initiative, method: :delete, class: "btn btn-default delete-btn"

end
