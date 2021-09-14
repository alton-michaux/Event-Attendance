require 'factory_bot'
require 'spec/factories/members'

module Seeds

  class SampleMembers

    def self.run
    u = Factory(:member)
  end
end
