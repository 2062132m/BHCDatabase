class InitiativesGrid
  include Datagrid

  scope do
    Initiative
  end

  filter(:id, :string, :multiple => ',')
  filter(:name, :string) { |value| where.has { name =~ "%#{value}%" } }
  filter(:area, :string, :multiple => ',', :header => 'Area ID')
  filter(:location, :string) { |value| where.has { location =~ "%#{value}%" } }

  column(:id) do |model|
    format(model.id) { |value| link_to value, model }
  end
  column(:name) do |model|
    format(model.name) { |value| link_to value, model }
  end
  column(:location)
  column(:description)
  column(:area_id, :header => 'Area') do |model|
    format(model.area_id) { |value| Area.find(value).name }
  end
end
