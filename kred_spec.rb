require "./kred.rb"

id, key = '[app_id]', '[app_key]'

describe Kred::KredAPI do
  api = Kred::KredAPI.new(id, key)
  %W[ kred kred_score ].each do |method|
    it "#{method} returns something for us" do
      data = api.send(method,
        source: 'twitter',
        term: 'zombies',
      )
      data['status'].should be_true

      data.should have_key 'data'
    end
  end
end
