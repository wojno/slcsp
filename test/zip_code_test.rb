require './test/test_helper'

describe ZipCode do
  it 'should create a zip code from a csv line' do
    line = "36008,AL,01001,Autauga,11\n"
    zip  = ZipCode.new(line).create_from_csv
    assert_equal('36008', zip[:zip])
    assert_equal('AL11', zip[:rate_area])
  end

  it 'should create a zi[ code from a zip with a leading zero' do
    line = "06440,CT,09001,Fairfield,1"
    zip  = ZipCode.new(line).create_from_csv
    assert_equal('06440', zip[:zip])
  end
end
