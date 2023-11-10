require_relative "lib/blog/version"

Gem::Specification.new do |spec|
  spec.name        = "blog"
  spec.version     = Blog::VERSION
  spec.authors     = ["alex-ismailov"]
  spec.email       = ["alexx.ismailov@gmail.com"]
  # spec.homepage    = ""
  spec.homepage    = "https://github.com/alex-ismailov"
  spec.summary     = "Summary of Blog."
  spec.description = "Description of Blog."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/alex-ismailov"
  spec.metadata["changelog_uri"] = "https://github.com/alex-ismailov"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.1.1"
end
