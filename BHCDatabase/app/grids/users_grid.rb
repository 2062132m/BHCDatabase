class UsersGrid

  include Datagrid

  scope do
    User
  end


  #
  # Filters
  #

  filter(:id, :string, :multiple => ',')
  #filter(:name, :string, :multiple => ',')
  filter(:name, :string) { |value| where('name like ? ',"%#{value}%") }
  filter(:email, :string)
  filter(:telephone, :integer)
  filter(:emergency_contact, :integer)
  filter(:dob, :date, :range => true)

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
  column(:email, :mandatory => true)
  column(:telephone, :mandatory => true)
  column(:emergency_contact, :mandatory => true)
  column(:dob, :mandatory => true)
  column(:privilege, :mandatory => true,
         :header => 'Privileges <html><button button id="pop" data-trigger="hover"
                    data-toggle="popover" title="Levels of Privileges:"
                    data-content="<b>LEVEL 0: </b>Admin <br>
                    <b>LEVEL 1: </b>Volunteer <br>
                    <b>LEVEL 2: </b>User <br>"> <span class="glyphicon glyphicon-question-sign"></span></button>
                    <script>$("#pop").popover({html:true}); </script> </html>'.html_safe , :html => true, )

end
