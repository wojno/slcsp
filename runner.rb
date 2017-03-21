Dir.glob('./lib/*.rb', &method(:require))

# read in the slcsp and process for homework assignment
class Runner
  
  HEADER = 'zipcode,rate'

  def initialize(format=nil)
    @plans    = populate_silver_plans
    @zipcodes = populate_zipcodes
    @format   = format
  end

  def plans
    @plans
  end

  def zipcodes
    @zipcodes
  end

  def process
    data   = read_and_process_csv
    print(data)
  end

  private

  def print(data)
    case @format
    when 'console'
      puts HEADER
      puts data 
    when 'csv'
      File.open('./slcsp.csv', 'w'){|file|
        file.puts HEADER
        data.each{|dat|
          file.puts dat
        }
      }
      puts 'Check slcsp.csv for new data!'
    else
      puts 'Unknown Format'
    end
  end

  def read_and_process_csv
    data = []
    File.open('./slcsp.csv','r'){|file|
      file.lazy.drop(1).each{|line|
        zip = line.split(',')[0]
        data << "#{zip},#{Slcsp.new(@plans, @zipcodes).calculate(zip)}"
      }
    }
    data
  end

  def populate_silver_plans 
    silver_plans = {}
    File.open('./plans.csv') do |file|
      file.lazy.drop(1).each_slice(500){ |lines|
        lines.each{|line|
          if line.match(/Silver/)
            plan = Plan.new(line).create_from_csv
            rate_area = plan[:rate_area]
            # OPTIMIZE: DRY up the duplicate call
            silver_plans[rate_area] ||= []
            # TODO: do we need to remove rate_area here?
            silver_plans[rate_area] << plan.reject{|key| key.match(/rate_area/)}
          end
        }
      }
      silver_plans
    end
  end  

  def populate_zipcodes
    zipcodes = {}
    File.open('./zips.csv') do |file|
      file.lazy.drop(1).each_slice(500){ |lines|
        lines.each{|line|
          zipcode = ZipCode.new(line).create_from_csv
          zip     = zipcode[:zip]
          # OPTIMIZE: DRY up the duplicate call
          zipcodes[zip] ||= []
          zipcodes[zip] << zipcode[:rate_area]
        }
      }
    end
    zipcodes
  end

end
