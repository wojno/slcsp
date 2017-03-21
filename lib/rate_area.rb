# Generate rate area string from state and code strings
class RateArea
  def initialize(state:, code:)
    @state = state
    @code  = code
  end

  def generate
    generate_code
  end

  private

  def generate_code
    @state + @code
  end
end
