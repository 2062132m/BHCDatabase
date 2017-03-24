class UnassignedConditionsGrid
  include Datagrid

  scope do
    UnassignedCondition
  end

  column(:medical_condition_id, :header => 'Medical Condition') do |model|
    format(model.medical_condition_id) do
      link_to MedicalCondition.find(model.medical_condition_id).name, MedicalCondition.find(model.medical_condition_id)
    end
  end
  column(:date_assigned, :header => 'Date Assigned') do |model|
    format(model.date_assigned) { |value| value.strftime('%d/%m/%Y - %H:%M') }
  end
  column(:created_at, :header => 'Date Unassigned') do |model|
    format(model.created_at) { |value| value.strftime('%d/%m/%Y - %H:%M') }
  end
end
