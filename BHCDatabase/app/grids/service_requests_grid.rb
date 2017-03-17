class ServiceRequestsGrid
  include Datagrid

  scope do
    ServiceRequest
  end

  column(:user_id, :header => 'User', :mandatory => true) do |model|
    format(model.user_id) do |value|
      link_to User.find(value).known_as, User.find(value) if value
    end
  end
  column(:request, :mandatory => true)
  column(:created_at, :mandatory => true) do |model|
    format(model.created_at) { |value| value.strftime('%d/%m/%Y - %H:%M') }
  end
  column(:id, :header => 'Delete', :mandatory => true) do |model|
    format(model.id) do |value|
      link_to "<i class='glyphicon glyphicon-trash'></i> Delete".html_safe, service_request_path(value), method: :delete, class: "btn btn-default delete-btn2"
    end
  end
end


