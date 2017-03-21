require './lib/rate_area'
require './lib/string'

# Create basic plan object from csv line
# containing id, price and rate_area
class Plan
  def initialize(line)
    @line = line
    @plan = {}
  end

  def create_from_csv
    process_line
  end

  private

  def process_line
    parsed = @line.split_and_sanitize_to_a
    {
      id:        parsed[0],
      price:     parsed[3],
      rate_area: RateArea.new(state: parsed[1], code: parsed[4]).generate
    }
  end
end
