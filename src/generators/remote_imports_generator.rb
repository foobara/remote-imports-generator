module Foobara
  module Generators
    module RemoteImportsGenerator
      module Generators
        class RemoteImportsGenerator < Foobara::FilesGenerator
          class << self
            def manifest_to_generator_classes(manifest)
              case manifest
              when RemoteImportsConfig
                [
                  Generators::BootGenerator,
                  Generators::GemfileGenerator
                ]
              else
                # :nocov:
                raise "Not sure how build a generator for a #{manifest}"
                # :nocov:
              end
            end
          end

          alias remote_imports_config relevant_manifest

          def templates_dir
            # :nocov:
            "#{__dir__}/../../templates"
            # :nocov:
          end

          # TODO: promote this up to base project
          def ==(other)
            # :nocov:
            self.class == other.class && remote_imports_config == other.remote_imports_config
            # :nocov:
          end

          def hash
            remote_imports_config.hash
          end
        end
      end
    end
  end
end
