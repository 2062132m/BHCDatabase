class MedicalConditionsGrid
  include Datagrid

  scope do
    MedicalCondition
  end

  filter(:id, :string, :multiple => ',')
  filter(:name, :string) { |value| where.has { name =~ "%#{value}%" } }

  column(:id) do |model|
    format(model.id) { |value| link_to value, model }
  end
  column(:name) do |model|
    format(model.name) { |value| link_to value, model }
  end
  column(:description)
end
