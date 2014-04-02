class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      t.string  :name
      t.float   :basic
      t.float   :hra
      t.float   :children_allowance, :default => 0
      t.float   :transport_allowance, :default => 0
      t.float   :medical_allowance, :default => 0
      t.float   :tech_research_allowance, :default => 0
      t.float   :special_allowance, :default => 0
      t.float   :internet_and_telephone, :default => 0
      t.float   :pf_contribution_by_employer, :default => 0
      t.float   :leave_travel_allowance, :default => 0
      t.float   :gross_salary, :default => 0
      t.float   :tds, :default => 0
      t.float   :pf, :default => 0
      t.float   :advance, :default => 0
      t.float   :net_payable, :default => 0
      t.integer :user_id
    end
  end
end
