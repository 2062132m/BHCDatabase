class FundersForMedicalConditionGrid
  include Datagrid

  scope do
    MedicalConditionFunder
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
      @medical_condition_funder = MedicalConditionFunder.find(value)
      # Delete the condition, which will in turn create an 'unassigned_condition'
      link_to "<i class='glyphicon glyphicon-remove-sign'></i> Remove Funding".html_safe, remove_medical_funding_funder_path(@medical_condition_funder), class: "btn btn-default unenrol-btn"
    end
  end
end
