require './lib/rate_area'
require './lib/string'

# Create basic zip code object from csv line
# containing ...
class ZipCode
  def initialize(line)
    @line = line
    @zip  = {} 
  end

  def create_from_csv
    process_line
  end

  private

  def process_line
    parsed = @line.split_and_sanitize_to_a
    {
      zip:       parsed[0],
      rate_area: RateArea.new(state: parsed[1], code: parsed[4]).generate
    }
  end

end
