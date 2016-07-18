require 'rails_helper'

describe Mailing do
 it { should validate_presence_of(:name) }
 it { should validate_presence_of(:email) }
end
