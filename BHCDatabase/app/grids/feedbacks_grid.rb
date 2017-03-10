class FeedbacksGrid
  include Datagrid

  scope do
    Feedback
  end

  column(:id, :mandatory => true) do |model|
    format(model.id) { |value| link_to value, model }
  end
  column(:created_at, :mandatory => true, :header => 'Date') do |model|
    format(model.created_at) { |value| link_to value.strftime('%d/%m/%Y - %H:%M'), model }
  end

end
