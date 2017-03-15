class RemovedFundingsForUsersGrid
  include Datagrid

  scope do
    RemovedUserFunding
  end

  column(:funding_id, :header => 'Funder', :mandatory => true) do |model|
    format(model.funder_id) do |value|
      funder = Funder.find(value)
      link_to funder.name, funder
    end
  end
  column(:date_given, :header => 'Date Given', :mandatory => true) do |model|
    format(model.date_given) { |value| value.strftime('%d/%m/%Y - %H:%M') }
  end
  column(:created_at, :header => 'Date Removed', :mandatory => true) do |model|
    format(model.created_at) { |value| value.strftime('%d/%m/%Y - %H:%M') }
  end
end
