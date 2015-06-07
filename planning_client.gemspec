# encoding: utf-8
Gem::Specification.new do |gem|
  gem.authors       = ["Dwayne Macgowan"]
  gem.email         = ["dwaynemac@gmail.com"]
  gem.description   = %q{Padma Planning client with LogicalModel}
  gem.summary       = %q{Client library for padma-planning-ws}
  gem.homepage      = ""

  gem.files = Dir["{app,lib,config,vendor}/**/*"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "planning_client"
  gem.require_paths = ["lib"]
  gem.version       = '0.0.4'

  gem.add_dependency "railties", ">= 3.1"
  gem.add_dependency 'logical_model', "~> 0.5.12"

end
