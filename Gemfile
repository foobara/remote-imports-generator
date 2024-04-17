source "https://rubygems.org"
ruby File.read("#{__dir__}/.ruby-version")

gemspec

# TODO: move this to .gemspec
gem "foobara", git: "foobara", branch: "main"

# gem "foobara-dotenv-loader", github: "foobara/dotenv-loader"
# gem "foobara-dotenv-loader", path: "../dotenv-loader"
gem "foobara-files-generator", github: "foobara/files-generator"
# gem "foobara-files-generator", path: "../files-generator"
# gem "foobara-remote-imports", github: "remote-imports", branch: "main"
# gem "foobara-remote-imports", path: "..-connector", branch: "main"
# gem "foobara-redis-crud-driver", github: "foobara/redis-crud-driver"
# gem "foobara-redis-crud-driver", path: "../redis-crud-driver"
# gem "foobara-remote-imports", github: "foobara/remote-imports"
# gem "foobara-remote-imports", path: "../remote-imports"
# gem "foobara-remote-imports", github: "foobara/remote-imports"
# gem "foobara-remote-imports", path: "../remote-imports"
# gem "foobara-remote-imports", github: "foobara/remote-imports"
# gem "foobara-sh-cli-connector", path: "../sh-cli-connector"
gem "foobara-util", github: "foobara/util"
# gem "foobara-util", path: "../util"

gem "rake"

group :development do
  gem "foobara-rubocop-rules", github: "foobara/rubocop-rules"
  gem "guard-rspec"
  gem "rubocop-rake"
  gem "rubocop-rspec"
end

group :development, :test do
  gem "pry"
  gem "pry-byebug"
end

group :test do
  gem "foobara-spec-helpers", github: "foobara/spec-helpers"
  gem "rspec"
  gem "rspec-its"
  gem "simplecov"
end
