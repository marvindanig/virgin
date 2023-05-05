module virgin
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a virgin locale files to your application."

      def copy_locale
        empty_directory "config/virgins"
        env_list = Dir.glob("#{destination_root}/config/environments/*")
        env_list.each do |env_file|
          env_name = File.basename(env_file, ".rb")
          unless (env_name == "production" &&  FileTest.exists?("public/virgins.txt"))
            copy_file "virgins.txt", "config/virgins/#{env_name}.txt"
          end
        end
        if FileTest.exists?("public/virgins.txt")
         copy_file File.join(destination_root + "/public/virgins.txt"), "config/virgins/production.txt"
         remove_file "public/virgins.txt"
        end
      end

      def add_virgin_route
        route "mount_virgin"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end
