class Person < ActiveRecord::Base
	has_one :cell_phone, class_name: "CellPhone", foreign_key: "person_id"
end
