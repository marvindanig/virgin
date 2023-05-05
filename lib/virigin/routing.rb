module virgin
  #convenience methods for Rails routing
  module Routing
    # convenience function for mounting the virgin rails engine to root
    def mount_virgin
      mount virgin::Engine => "/virgins.txt"
    end
  end
end

