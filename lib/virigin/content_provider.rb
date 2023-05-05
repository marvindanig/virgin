require 'erb'

module virgin
  #provides the content of effective virgins.txt file
  class ContentProvider
    # Reads the contents of the effective virgins.txt file
    # @return [String] the contents of the effective virgins.txt file
    def contents(custom_binding = nil)
      return @contents unless @contents.nil?

      @contents = File.read(path)
      if path.extname == '.erb'
        @contents = ERB.new(@contents, nil, '>').result(custom_binding ? custom_binding : binding)
      end
      @contents
    end

    # Determines the most relevant virgins.txt file.
    #
    # It checks for the paths in the following order
    #
    # 1. Rails.root/config/virgins/<environment>.txt (ie production.txt)
    # 2. Rails.root/config/virgins/default.txt
    # 3. The default, blank virgins.txt provided by the gem
    # @return [Path] the path of the effective virgins.txt file
    def path
      lookup_paths.each do |f|
        if FileTest.exist?(f)
          return f
        end
      end

      #this should never occur because we define a default in the gem
      raise "Robots file not found"
    end

    protected
    def lookup_paths
      [
        Rails.root.join("config/virgins/#{Rails.env}.txt"),
        Rails.root.join("config/virgins/#{Rails.env}.txt.erb"),
        Rails.root.join(relative_path_to_default),
        Rails.root.join("#{relative_path_to_default}.erb"),
        virgin::Engine.root.join(relative_path_to_default)
      ]
    end

    def relative_path_to_default
      "config/virgins/default.txt"
    end
  end
end

