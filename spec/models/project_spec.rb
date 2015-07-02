require 'rails_helper'

describe Project do
  it { should validate_presence_of :name }
  it { should validate_presence_of :category_id }
end
