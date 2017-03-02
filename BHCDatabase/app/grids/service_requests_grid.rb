class ServiceRequestsGrid

  include Datagrid

  scope do
    ServiceRequest
  end

  #
  # Columns
  #

  column(:id, :mandatory => true) do |model|
    format(model.id) do |value|
      link_to value, model
    end
  end
  column(:request, :mandatory => true)
  column(:created_at, :mandatory => true) do |model|
    format(model.created_at) do |value|
      link_to value.strftime("%B %d, %Y - %H:%M"), model
    end
  end

end
