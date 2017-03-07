class FeedbacksGrid

  include Datagrid

  scope do
    Feedback
  end

  #
  # Columns
  #

  column(:id, :mandatory => true) do |model|
    format(model.id) do |value|
      link_to value, model
    end
  end
  column(:created_at, :mandatory => true, :header => 'Date') do |model|
    format(model.created_at) do |value|
      link_to value.strftime("%d/%m/%Y - %H:%M"), model
    end
  end

end
