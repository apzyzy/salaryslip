require 'csv-mapper'

class User < ActiveRecord::Base
  has_one :salary
end

include CsvMapper

if(User.count == 0)
  results = import(Rails.root.join('doc', 'users.csv')) do
    map_to User # Map to the Person ActiveRecord class (defined above) instead of the default OpenStruct.
    after_row lambda{|row, user| user.save }  # Call this lambda and save each record after it's parsed.

    start_at_row 0
    [name, email, pan, designation, pf, joined_at]
  end
end