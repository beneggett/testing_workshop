require 'test_helper'

class GiphyTest < ActiveSupport::TestCase
  it 'gets a gif from giphy' do
    VCR.use_cassette('get a gif from giphy') do
      assert Giphy.get('fail').include? 'giphy.com/'
    end
  end
end
