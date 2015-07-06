module Openfire
  module Ruby
    class Base

      include Her::Model
      use_api Openfire::Client::HER_CLIENT
      parse_root_in_json true

    end
  end
end
