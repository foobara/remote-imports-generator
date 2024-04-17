require_relative "generate_rack_connector"

module Foobara
  module Generators
    module RackConnectorGenerator
      class WriteRackConnectorToDisk < Foobara::Generators::WriteGeneratedFilesToDisk
        class << self
          def generator_key
            "rack-connector"
          end
        end

        depends_on GenerateRackConnector

        inputs do
          rack_connector_config RackConnectorConfig, default: RackConnectorConfig.new
          # TODO: should be able to delete this and inherit it
          output_directory :string
        end

        def execute
          generate_file_contents
          write_all_files_to_disk
          run_post_generation_tasks

          stats
        end

        def output_directory
          inputs[:output_directory] || default_output_directory
        end

        def default_output_directory
          "."
        end

        def generate_file_contents
          puts "generating files..."
          # TODO: just pass this in as the inputs instead of the rack_connector??
          self.paths_to_source_code = run_subcommand!(GenerateRackConnector,
                                                      rack_connector_config.attributes)
        end

        def run_post_generation_tasks
          Dir.chdir output_directory do
            bundle_install
            rubocop_autocorrect
          end
        end

        def bundle_install
          puts "bundling..."
          cmd = "bundle install"

          Bundler.with_unbundled_env do
            Open3.popen3(cmd) do |_stdin, _stdout, stderr, wait_thr|
              exit_status = wait_thr.value

              unless exit_status.success?
                # :nocov:
                warn "WARNING: could not #{cmd}\n#{stderr.read}"
                # :nocov:
              end
            end
          end
        end

        def rubocop_autocorrect
          puts "linting..."
          cmd = "bundle exec rubocop --no-server -A"

          Open3.popen3(cmd) do |stdin, _stdout, stderr, wait_thr|
            exit_status = wait_thr.value
            unless exit_status.success?
              # :nocov:
              warn "WARNING: could not #{cmd}.\n#{stdin.read}\n#{stderr.read}"
              # :nocov:
            end
          end
        end
      end
    end
  end
end
