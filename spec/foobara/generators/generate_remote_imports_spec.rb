RSpec.describe Foobara::Generators::RemoteImportsGenerator::GenerateRemoteImports do
  let(:inputs) do
    {}
  end
  let(:command) { described_class.new(inputs) }
  let(:outcome) { command.run }
  let(:result) { outcome.result }

  it "generates a remote_imports" do
    expect(outcome).to be_success

    expect(result.keys).to include("boot/http.rb")
  end
end
