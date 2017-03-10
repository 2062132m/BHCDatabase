class InitiativesGrid
  include Datagrid

  scope do
    Initiative
  end

  filter(:id, :string, :multiple => ',')
  filter(:name, :string) { |value| where('name like ?', "%#{value}%") }
  filter(:area, :string, :multiple => ',')
  filter(:location, :string) { |value| where('location like ?', "%#{value}%") }

  column(:id, :mandatory => true) do |model|
    format(model.id) { |value| link_to value, model }
  end
  column(:name, :mandatory => true) do |model|
    format(model.name) { |value| link_to value, model }
  end
  column(:location, :mandatory => true)
  column(:description, :mandatory => true)
  column(:area_id, :header => 'Area', :mandatory => true) do |model|
    format(model.area_id) { |value| Area.find(value).name }
  end
end
