require './test/test_helper'

describe Plan do

  it 'should create a plan from a csv line' do
    line = "72190DW3284384,AZ,Silver,353.37,4\n"
    plan = Plan.new(line).create_from_csv
    assert_equal('72190DW3284384', plan[:id])
    assert_equal('AZ4',            plan[:rate_area])
    assert_equal('353.37',         plan[:price])
  end

  it "should properly sanitize the line removing spaces and returns" do
    line = " 1138 ,PA\n\n, Gold,21.12 ,42 \n"
    plan = Plan.new(line).create_from_csv
    assert_equal('1138',  plan[:id])
    assert_equal('PA42',  plan[:rate_area])
    assert_equal('21.12', plan[:price])
  end

end
