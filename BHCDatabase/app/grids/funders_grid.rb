class FundersGrid
  include Datagrid

  scope do
    Funder
  end

  filter(:id, :string, :multiple => ',')
  filter(:name, :string) { |value| where('name like ? ', "%#{value}%") }
  filter(:address, :string) { |value| where('address like ? ', "%#{value}%") }
  filter(:url, :string) { |value| where('url like ? ', "%#{value}%") }
  filter(:email, :string) { |value| where('email like ? ', "%#{value}%") }
  filter(:telephone, :string) { |value| where('telephone like ? ', "%#{value}%") }

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
