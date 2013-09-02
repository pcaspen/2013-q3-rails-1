class CellPhone < ActiveRecord::Base
	has_one :person, class_name: "People", foreign_key: "person_id"
end
