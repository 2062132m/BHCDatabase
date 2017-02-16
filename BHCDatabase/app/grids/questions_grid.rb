class QuestionsGrid

  include Datagrid

  scope do
    Question
  end

  #
  # Filters
  #

  filter(:id, :string, :multiple => ',')
  filter(:question, :string) { |value| where('question like ?', "%#{value}%") }
  filter(:visible, :boolean)
  filter(:multiple_choice, :boolean)
  filter(:sort, :integer, :multiple => ',')

  #
  # Columns
  #

  column(:id, :mandatory => true) do |model|
    format(model.id) do |value|
      link_to value, model
    end
  end
  column(:question, :mandatory => true) do |model|
    format(model.question) do |value|
      link_to value, model
    end
  end
  column(:visible, :mandatory => true)
  column(:multiple_choice, :mandatory => true)
  column(:sort, :mandatory => true)

end
