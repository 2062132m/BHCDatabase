class ServiceRequestsGrid

  include Datagrid

  scope do
    ServiceRequest
  end

  #
  # Columns
  #



  column(:user_id, :mandatory => true) do |model|
    format(model.user_id) do |value|
     User.find(value).name
  end
end

  column(:request, :mandatory => true)
  column(:created_at, :mandatory => true) do |model|
    format(model.created_at) do |value|
      value.strftime("%B %d, %Y - %H:%M")
    end
  end

end
