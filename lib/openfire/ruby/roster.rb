# This class should never be used directly in your code.
# Create an instance of Openfire::Client first and then
# use client.users
module Openfire
  module Ruby
    class Roster < Base
      belongs_to :user
    end
  end
end
