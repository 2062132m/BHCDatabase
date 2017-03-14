class MedicalConditionsGrid
  include Datagrid

  scope do
    MedicalCondition
  end

  filter(:id, :string, :multiple => ',')
  filter(:name, :string) { |value| where('name like ? ', "%#{value}%") }

  column(:id, :mandatory => true) do |model|
    format(model.id) { |value| link_to value, model }
  end
  column(:name, :mandatory => true) do |model|
    format(model.name) { |value| link_to value, model }
  end
  column(:description, :mandatory => true)
end
