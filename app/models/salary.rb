class Salary < ActiveRecord::Base
  belongs_to :user
  SALARY_URL = ""

  ROW_MAP = {
      "Name of Employee"=> "name",
      "Basic"=> "basic",
      "HRA"=> "hra",
      "Children \nAllow."=> "children_allowance",
      "Transport Allow."=> "transport_allowance",
      "Medical  Allow."=> "medical_allowance",
      "Tech. Research Allow."=> "tech_research_allowance",
      "Special Allow."=> "special_allowance",
      "Internet & Telephone"=> "internet_and_telephone",
      "PF Cont.by Emplyr."=> "pf_contribution_by_employer",
      "Leave Travel Allow."=> "leave_travel_allowance",
      "Gross Salary"=> "gross_salary",
      "TDS"=> "tds",
      "PF"=> "pf",
      "Advance"=> "advance",
      "Net Payable" => "net_payable"
  }

  def self.import_xls
    Salary.destroy_all # We only import one month at a time # Change to keep historical data

    require 'roo'

    s = Roo::Google.new(APP_CONFIG[:xls_key], {:user => APP_CONFIG[:username], :password => APP_CONFIG[:password]})

    s.default_sheet = s.sheets.first

    data = s.parse(:header_search => ['Basic'])

    data.shift
    data.pop

    data.each do |d|
      d.delete('S. No.') # This will delete all the information tht has not been mapped !
    end


    dat = data.collect {|d| Hash[d.map {|k, v| [Salary::ROW_MAP[k].to_sym, v] }]}

    dat.each do |d|
      d['user_id'] = User.find_by_name(d[:name].strip).id rescue nil

      Salary.create(d)
    end
  end
end
