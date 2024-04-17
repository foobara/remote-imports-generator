module Foobara
  module Generators
    module RemoteImportsGenerator
      module Generators
        class BootGenerator < RemoteImportsGenerator
          def template_path
            "boot/remote.rb.erb"
          end
        end
      end
    end
  end
end
