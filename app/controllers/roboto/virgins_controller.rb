module Virgin
  class VirginsController < Virgin::ApplicationController
    def show
      render_sym = Rails.version.split(".")[0].to_i >= 7 ? :plain : :text
      render render_sym => virgin_contents,
        layout: false,
        content_type: 'text/plain'
    end

    protected
    def virgin_contents
      # process erb template in the context of this controller request
      Virgin::ContentProvider.new.contents(binding)
    end

    def virgins_path
      Rails.root.join("config/virgin/#{Rails.env}.txt")
    end

    def default_virgins
      [
        Rails.root.join("config/virgins/#{Rails.env}.txt"),
        Rails.root.join(default_path),
        Virgin::Engine.root.join(default_path)
      ].each do |path|
        return path if FileTest.exists?(path)
      end
    end


  end
end

