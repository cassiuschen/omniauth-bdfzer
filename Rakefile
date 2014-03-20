require 'rake'
require 'rake/testtask'
require 'rake/clean'
require 'rake/gempackagetask'
require 'rake/rdoctask'
require 'fileutils'
include FileUtils

version="0.1"
name="omniauth-bdfzer"

spec = Gem::Specification.new do |s|
  s.name = name
  s.version = version
  s.description = s.summary = "BDFZer OAuth2 Strategy for OmniAuth"
  s.author = "Cassius Chen"
  s.add_dependency('omniauth-oauth2')
  
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README"]
  
  s.files = %w(COPYING LICENSE README Rakefile) +
    Dir.glob("lib/**/*")
  
  s.require_path = "lib"
  s.bindir = "bin"
end

Rake::GemPackageTask.new(spec) do |p|
  p.need_tar = true if RUBY_PLATFORM !~ /mswin/
end

task :install => [:test, :package] do
  sh %{sudo gem install pkg/#{name}-#{version}.gem}
end

task :uninstall => [:clean] do
  sh %{sudo gem uninstall #{name}}
end

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'doc/rdoc'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.add ['README', 'LICENSE', 'COPYING', 'lib/**/*.rb', 'doc/**/*.rdoc']
end

task :default => [:test, :package]

CLEAN.include ['build/*', '**/*.o', '**/*.so', '**/*.a', 'lib/*-*', '**/*.log', 'pkg', 'lib/*.bundle', '*.gem', '.config']

