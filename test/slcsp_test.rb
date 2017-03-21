require './test/test_helper'
require './runner'

describe Slcsp do
  def setup
    plans = {
      'WI15' => [
        {id: 'WI1', price: '400.44'},
        {id: 'WI8', price: '255.25'},
        {id: 'WI2', price: '255.26'} 
      ]
    }
    zipcodes = {
      '40813' => ['KY8'],
      '54923' => ['WI15'],
      '46706' => ['IN3', 'IN4'],
      '00000' => []
    }
    @slcsp = Slcsp.new(plans, zipcodes) 
  end
  it 'should calculate the slcsp' do
    assert_equal('255.26', @slcsp.calculate('54923'))
  end
  it 'should return nil if the zipcode exists in multiple counties' do
    assert_nil(@slcsp.calculate('00000'))
  end
  it 'should return nil when the zipcode exists in multiple rate areas' do
    assert_nil(@slcsp.calculate('46706'))
  end
  it 'should calculate correctly against the target csv' do
    zips = [
             {zipcode: '64148', price: '245.2'},
             {zipcode: '67118', price: '212.35'},
             {zipcode: '40813', price: nil},
             {zipcode: '18229', price: '231.48'},
             {zipcode: '51012', price: '252.76'},
             {zipcode: '79168', price: '243.68'},
             {zipcode: '54923', price: nil},
             {zipcode: '67651', price: '249.44'},
             {zipcode: '49448', price: '221.63'},
             {zipcode: '27702', price: '283.08'},
             {zipcode: '47387', price: '326.98'},
             {zipcode: '50014', price: '287.3'},
             {zipcode: '33608', price: '268.49'},
             {zipcode: '06239', price: nil},
             {zipcode: '54919', price: '243.77'},
             {zipcode: '46706', price: nil},
             {zipcode: '14846', price: nil},
             {zipcode: '48872', price: nil},
             {zipcode: '43343', price: nil},
             {zipcode: '77052', price: '243.72'},
             {zipcode: '07734', price: nil},
             {zipcode: '95327', price: nil},
             {zipcode: '12961', price: nil},
             {zipcode: '26716', price: '278.9'},
             {zipcode: '48435', price: nil},
             {zipcode: '53181', price: '306.56'},
             {zipcode: '52654', price: '230.29'},
             {zipcode: '58703', price: '297.93'},
             {zipcode: '91945', price: nil},
             {zipcode: '52146', price: '254.56'},
             {zipcode: '56097', price: nil},
             {zipcode: '21777', price: nil},
             {zipcode: '42330', price: nil},
             {zipcode: '38849', price: '285.69'},
             {zipcode: '77586', price: '243.72'},
             {zipcode: '39745', price: '265.73'},
             {zipcode: '03299', price: '240.45'},
             {zipcode: '63359', price: nil},
             {zipcode: '60094', price: '209.95'},
             {zipcode: '15935', price: '183.94'},
             {zipcode: '39845', price: '325.64'},
             {zipcode: '48418', price: nil},
             {zipcode: '28411', price: '307.51'},
             {zipcode: '37333', price: '219.29'},
             {zipcode: '75939', price: '234.5'},
             {zipcode: '07184', price: nil},
             {zipcode: '86313', price: '292.9'},
             {zipcode: '61232', price: '222.38'},
             {zipcode: '20047', price: nil},
             {zipcode: '47452', price: nil},
           ]
    runner = Runner.new
    slcsp  = Slcsp.new(runner.plans, runner.zipcodes)
    zips.select{|data| data[:price]}.each{|zip|
      assert_equal(zip[:price], slcsp.calculate(zip[:zipcode]))
    }
    zips.select{|data| data[:price].nil?}.each{|zip|
      assert_nil(slcsp.calculate(zip[:zipcode]))
    }
  end
end
