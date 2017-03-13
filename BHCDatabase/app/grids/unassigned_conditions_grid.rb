class UnassignedConditionsGrid
  include Datagrid

  scope do
    UnassignedCondition
  end

  column(:medical_condition_id, :header => 'Medical Condition', :mandatory => true) do |model|
    format(model.medical_condition_id) do
      link_to MedicalCondition.find(model.medical_condition_id).name, MedicalCondition.find(model.medical_condition_id)
    end
  end
  column(:date_assigned, :mandatory => true, :header => 'Assigned Condition') do |model|
    format(model.date_assigned) { |value| value.strftime('%d/%m/%Y - %H:%M') }
  end
  column(:created_at, :mandatory => true, :header => 'Unassigned Condition') do |model|
    format(model.created_at) { value.strftime('%d/%m/%Y - %H:%M') }
  end
end
