require 'rails_helper'

describe Blog do
  it { should validate_presence_of :text }
  it { should have_many :comments }
end
