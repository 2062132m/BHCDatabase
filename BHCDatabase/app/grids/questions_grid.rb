class QuestionsGrid
  include Datagrid

  scope do
    Question
  end

  filter(:id, :string, :multiple => ',')
  filter(:question, :string) { |value| where('question like ?', "%#{value}%") }
  filter(:visible, :boolean)
  filter(:multiple_choice, :boolean)

  column(:id, :mandatory => true) do |model|
    format(model.id) { |value| link_to value, model }
  end
  column(:question, :mandatory => true) do |model|
    format(model.question) { |value| link_to value, model }
  end
  column(:visible, :mandatory => true)
  column(:multiple_choice, :mandatory => true)
end
