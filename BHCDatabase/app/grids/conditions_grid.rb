class ConditionsGrid
  include Datagrid

  scope do
    Condition
  end

  column(:medical_condition_id, :mandatory => true) do |model|
    format(model.medical_condition_id) do
      link_to MedicalCondition.find(model.medical_condition_id).name, MedicalCondition.find(model.medical_condition_id)
    end
  end
  column(:created_at, :mandatory => true, :header => 'Date Assigned') do |model|
    format(model.created_at) { |value| value.strftime('%d/%m/%Y - %H:%M') }
  end
end
