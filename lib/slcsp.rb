# determine the second lowest cost silver plan from source plan and zipcode csvs
class Slcsp

  def initialize(plans, zipcodes)
    @silver_plans = plans
    @zipcodes     = zipcodes
  end

  def calculate(zipcode)
    slcsp(zipcode)
  end

  private
  
  
  def slcsp(zipcode)
    z_data = @zipcodes[zipcode.to_s].uniq
    return nil unless able_to_calculate?(z_data)
    determine_second_lowest(z_data)
  end

  def determine_second_lowest(data)
    @silver_plans[data[0]].sort_by! {|h| h[:price]}[1][:price]
  end

  def able_to_calculate?(data)
    case
    when no_data_available?(data),
         second_lowest_unavailable?(data),
         multi_rate_area?(data)
      false
    else
      true
    end
  end

  def no_data_available?(data)
    @silver_plans[data[0]] && @silver_plans[data[0]].size > 0 ? false : true
  end

  def second_lowest_unavailable?(data)
    @silver_plans[data[0]] && @silver_plans[data[0]].size >= 2 ? false : true
  end

  def multi_rate_area?(rate_areas)
    rate_areas.size != 1 ? true : false
  end 
end
