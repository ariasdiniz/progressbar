# frozen_string_literal: true

require_relative 'lib/progressbar/version'

Gem::Specification.new do |spec|
  spec.name = 'aria_progress_bar'
  spec.version = AriaProgressBar::VERSION
  spec.authors = ['Aria Diniz']
  spec.email = ['aria.diniz.dev@gmail.com']

  spec.summary = 'Simple progress bar for Ruby'
  spec.description = 'Simple progress bar for Ruby'
  spec.homepage = 'https://github.com/ariasdiniz/progressbar'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.7.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  # spec.metadata['changelog_uri'] = ""

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.metadata['rubygems_mfa_required'] = 'true'
end
