class MedicalConditionsGrid

  include Datagrid

  scope do
    MedicalCondition
  end

  filter(:condition, :dynamic, :header => "Filter")

  column(:id, :mandatory => true) do |model|
    format(model.id) do |value|
      link_to value, model
    end
  end
  column(:name, :mandatory => true) do |model|
    format(model.name) do |value|
      link_to value, model
    end
  end
  column(:description, :mandatory => true)

end
