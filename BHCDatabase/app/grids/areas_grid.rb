class AreasGrid
  include Datagrid

  scope do
    Area
  end

  filter(:id, :string, :multiple => ',')
  filter(:name, :string) { |value| where.has { name =~ "%#{value}%" } }

  column(:id) { |model| format(model.id) { |value| link_to value, model } }
  column(:name) { |model| format(model.name) { |value| link_to value, model } }
  column(:description)
end
