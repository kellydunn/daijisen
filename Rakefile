<<<<<<< HEAD
require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "daijisen"
    gem.summary = "A simple scraper tool for Japanese to Japanese definitions"
    gem.description = "A simple scraper tool for the Yahoo Japanese to Japanese Daijisen Dictionary"
    gem.email = "defaultstring@gmail.com"
    gem.homepage = "http://github.com/kellydunn/daijisen"
    gem.authors = ["Kelly"]
    gem.add_development_dependency "thoughtbot-shoulda", ">= 0"
    gem.add_development_dependency "nokogiri"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "daijisen #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
=======
require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/daijisen'

Hoe.plugin :newgem
# Hoe.plugin :website
# Hoe.plugin :cucumberfeatures

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'daijisen' do
  self.developer 'Kelly Dunn', 'defaultstring@gmail.com'
  self.post_install_message = 'PostInstall.txt' # TODO remove if post-install message not required
  self.rubyforge_name       = self.name # TODO this is default value
  # self.extra_deps         = [['activesupport','>= 2.0.2']]

end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }

# TODO - want other tests/tasks run by default? Add them to the list
# remove_task :default
# task :default => [:spec, :features]
>>>>>>> origin/master
