require './test/test_helper'

describe RateArea do
 
  it 'should generate a rate area based upon state and code' do
    rate_area = RateArea.new(state: 'PA', code:'03')
    assert_equal('PA03', rate_area.generate)
  end

end
