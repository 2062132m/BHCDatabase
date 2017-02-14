class AreasGrid

  include Datagrid

  scope do
    Area
  end

  #
  # Filters
  #

  #filter(:condition, :dynamic, :header => "Filter")
  
  filter(:id, :string, :multiple => ',')
  filter(:name, :string, :multiple => ',')
  #filter(:created_at, :date, :range => true, :header => "Creation date")
  #filter(:updated_at, :date, :range => true, :header => "Updated date")

  #
  # Columns
  #

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
