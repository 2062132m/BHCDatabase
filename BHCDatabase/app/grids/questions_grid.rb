class QuestionsGrid
  include Datagrid

  scope do
    Question
  end

  filter(:id, :string, :multiple => ',')
  filter(:question, :string) { |value| where.has { question =~ "%#{value}%" } }
  filter(:visible, :boolean)
  filter(:question_type, :integer)

  column(:id) do |model|
    format(model.id) { |value| link_to value, model }
  end
  column(:question) do |model|
    format(model.question) { |value| link_to value, model }
  end
  column(:visible)
  column(:question_type)
end
