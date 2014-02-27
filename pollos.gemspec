$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pollos/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pollos"
  s.version     = Pollos::VERSION
  s.authors     = ["Rodrigo Haenggi"]
  s.email       = ["rodrigo@codegestalt.com"]
  s.homepage    = "http://rodrigohaenggi.com"
  s.summary     = "Poller written in Ruby"
  s.description = "Pollos checks Website statuses from a JSON hash and responds with the status code and response_time"
  s.license     = "MIT"

  s.files = Dir["{lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]
end
