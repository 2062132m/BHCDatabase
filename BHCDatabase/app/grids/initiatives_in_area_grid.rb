class InitiativesInAreaGrid
  include Datagrid

  scope do
    Initiative
  end

  column(:name) do |model|
    format(model.name) { |value| link_to value, model }
  end
  column(:location)
end
