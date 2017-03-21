class FundersGrid
  include Datagrid

  scope do
    Funder
  end

  filter(:id, :string, :multiple => ',')
  filter(:name, :string) { |value| where.has { name =~ "%#{value}%" } }
  filter(:address, :string) { |value| where.has { address =~ "%#{value}%" } }
  filter(:url, :string) { |value| where.has { url =~ "%#{value}%" } }
  filter(:email, :string) { |value| where.has { email =~ "%#{value}%" } }
  filter(:telephone, :string) { |value| where.has { telephone =~ "%#{value}%" }}

  column(:id, :mandatory => true) do |model|
    format(model.id) { |value| link_to value, model }
  end
  column(:name, :mandatory => true) do |model|
    format(model.name) { |value| link_to value, model }
  end
  column(:address, :mandatory => true)
  column(:url, :mandatory => true)
  column(:email, :mandatory => true)
  column(:telephone, :mandatory => true)
end
