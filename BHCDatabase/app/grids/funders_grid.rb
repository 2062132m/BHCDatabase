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

  column(:id) do |model|
    format(model.id) { |value| link_to value, model }
  end
  column(:name) do |model|
    format(model.name) { |value| link_to value, model }
  end
  column(:address)
  column(:url)
  column(:email)
  column(:telephone)
end
