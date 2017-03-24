class FundersForInitiativeGrid
  include Datagrid

  scope do
    InitiativeFunder
  end

  column(:funder_id) do |model|
    format(model.funder_id) do
      link_to Funder.find(model.funder_id).name, Funder.find(model.funder_id)
    end
  end
  column(:created_at, :header => 'Date Assigned') do |model|
    format(model.created_at) { |value| value.strftime('%d/%m/%Y - %H:%M') }
  end
  column(:id, :header => 'Remove Funding') do |model|
    format(model.id) do |value|
      @initiative_funder = InitiativeFunder.find(value)
      # Delete the condition, which will in turn create an 'unassigned_condition'
      link_to "<i class='glyphicon glyphicon-remove-sign'></i> Remove Funding".html_safe, remove_initiative_funding_funder_path(@initiative_funder), class: "btn btn-default unenrol-btn"
    end
  end
end
