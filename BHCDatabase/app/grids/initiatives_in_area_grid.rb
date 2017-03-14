class InitiativesInAreaGrid
  include Datagrid

  scope do
    Initiative
  end

  column(:id, :mandatory => true) do |model|
    format(model.id) { |value| link_to value, model }
  end
  column(:name, :mandatory => true) do |model|
    format(model.name) { |value| link_to value, model }
  end
  column(:location, :mandatory => true)
end
