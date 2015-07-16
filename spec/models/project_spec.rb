require 'rails_helper'

describe Project do
  it { should validate_presence_of :name }
  it { should validate_presence_of :category_id }

  it { should allow_value("http://www.google.com").for(:url) }
  it { should_not allow_value("www.google.com").for(:url) }
end
