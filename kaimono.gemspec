# frozen_string_literal: true

require_relative "lib/kaimono/version"

Gem::Specification.new do |spec|
  spec.name          = "kaimono"
  spec.version       = Kaimono::VERSION
  spec.authors       = ["icm7216"]
  spec.email         = ["icm7216d@gmail.com"]

  spec.summary       = "Ruby Shopping List"
  spec.description   = "Create your Shopping List. The kaimono command generates a shopping list with checkboxes from a shopping list in YAML format."
  spec.homepage      = "https://github.com/icm7216/kaimono"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "haml"

end
