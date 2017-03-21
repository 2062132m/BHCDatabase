class FeedbacksGrid
  include Datagrid

  scope do
    Feedback
  end

  column(:created_at, :mandatory => true, :header => 'Date Completed') do |model|
    format(model.created_at) { |value| link_to value.strftime('%d/%m/%Y - %H:%M'), model }
  end
end
