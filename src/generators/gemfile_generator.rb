module Foobara
  module Generators
    module RemoteImportsGenerator
      module Generators
        class GemfileGenerator < RemoteImportsGenerator
          def applicable?
            gemfile_contents !~ /^\s*gem\s*["']foobara-remote-imports\b/
          end

          def template_path
            "Gemfile"
          end

          def target_path
            "Gemfile"
          end

          def generate(_elements_to_generate)
            match = gemfile_contents.match(/^gem /)

            if match
              new_entry = 'gem "foobara-remote-imports", github: "foobara/remote-imports"'
              "#{match.pre_match}\n#{new_entry}\n#{match}#{match.post_match}"
            else
              # TODO: maybe print a warning and return the original Gemfile
              # :nocov:
              raise "Not sure how to inject remote_imports into the Gemfile"
              # :nocov:
            end
          end

          def gemfile_contents
            File.read(template_path)
          end
        end
      end
    end
  end
end
