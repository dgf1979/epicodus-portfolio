include Warden::Test::Helpers
Warden.test_mode!

RSpec.configure do |config|
  config.before :each do
    User.delete_all
  end
  config.after :each do
    Warden.test_reset!
  end
end
