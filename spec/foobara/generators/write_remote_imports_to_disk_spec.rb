RSpec.describe Foobara::Generators::RemoteImportsGenerator::WriteRemoteImportsToDisk do
  let(:command) { described_class.new(inputs) }
  let(:outcome) { command.run }
  let(:result) { outcome.result }
  let(:errors) { outcome.errors }
  let(:inputs) do
    {
      output_directory:
    }
  end
  let(:output_directory) { "#{__dir__}/../../../tmp/remote_imports_test_suite_output" }

  around do |example|
    FileUtils.rm_rf output_directory
    FileUtils.mkdir_p output_directory

    project_fixture_dir = "#{__dir__}/../../fixtures/test-project"

    Dir["#{project_fixture_dir}/*", "#{project_fixture_dir}/.*"].each do |f|
      next if f.end_with?(".")

      FileUtils.cp_r f, output_directory
    end

    Dir.chdir output_directory do
      example.run
    end
  end

  describe "#run" do
    it "contains base files" do
      expect(outcome).to be_success

      expect(command.paths_to_source_code.keys).to include("boot/remote.rb")
    end

    it "updates the Gemfile" do
      expect(outcome).to be_success

      expect(
        command.paths_to_source_code["Gemfile"]
      ).to include('gem "foobara-remote-imports", github: "foobara/remote-imports"')
    end

    context "when there's a url and commands to list" do
      let(:inputs) do
        {
          remote_imports_config:
        }
      end
      let(:remote_imports_config) do
        {
          url: "https://example.com/manifest",
          commands: %w[SomeCommand SomeOtherCommand]
        }
      end

      it "writes files to the current directory" do
        expect(outcome).to be_success
        remote_rb = command.paths_to_source_code["boot/remote.rb"]

        expect(remote_rb).to match(/"SomeCommand", "SomeOtherCommand"/)
      end
    end
  end

  describe ".generator_key" do
    subject { described_class.generator_key }

    it { is_expected.to be_a(String) }
  end
end
