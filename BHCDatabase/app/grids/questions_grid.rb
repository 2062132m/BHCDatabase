class QuestionsGrid

  include Datagrid

  scope do
    Question
  end

  filter(:condition, :dynamic, :header => "Filter")

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
