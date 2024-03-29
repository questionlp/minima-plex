# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name     = "minima-plex"
  spec.version  = "0.4.2"
  spec.authors  = ["Linh Pham", "Joel Glovier"]
  spec.email    = ["dev@wwdt.me", "jglovier@github.com"]

  spec.summary  = "Fork of the Jekyll minima theme, modified to use IBM Plex fonts."
  spec.homepage = "https://github.com/questionlp/minima-plex"
  spec.license  = "MIT"

  spec.metadata["plugin_type"] = "theme"

  spec.files = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r!^(assets|_(includes|layouts|sass)/|(LICENSE|README)((\.(txt|md|markdown)|$)))!i)
  end

  spec.add_runtime_dependency "jekyll", ">= 3.5", "< 5.0"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.9"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.1"
  spec.add_runtime_dependency "jekyll-paginate", "~> 1.1", "< 2.0"

  spec.add_development_dependency "bundler"
end
