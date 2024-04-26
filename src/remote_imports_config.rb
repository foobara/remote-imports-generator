require "English"

module Foobara
  module Generators
    module RemoteImportsGenerator
      class RemoteImportsConfig < Foobara::Model
        attributes do
          url :string
          commands [:string], default: []
        end

        def to_import_list
          if commands && !commands.empty?
            commands_ruby = commands.map { |command| "\"#{command}\"" }.join(", ")

            ",\nto_import: [#{commands_ruby}]"
          end
        end
      end
    end
  end
end
