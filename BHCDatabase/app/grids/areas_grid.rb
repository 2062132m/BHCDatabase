class AreasGrid
  include Datagrid

  scope do
    Area
  end

  filter(:id, :string, :multiple => ',')
  filter(:name, :string) { |value| where.has { name =~ "%#{value}%" } }

  column(:id, :mandatory => true) { |model| format(model.id) { |value| link_to value, model } }
  column(:name, :mandatory => true) { |model| format(model.name) { |value| link_to value, model } }
  column(:description, :mandatory => true)
end
