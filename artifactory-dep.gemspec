require File.join([File.dirname(__FILE__),'lib','artifactory-dep','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'artifactory-dep'
  s.version = ArtifactoryDep::VERSION
  s.author = 'Federico Maffei'
  s.email = 'federico.maffei@gmail.com'
  s.homepage = 'https://github.com/federicomaffei'
  s.platform = Gem::Platform::RUBY
  s.licenses = ['MIT']
  s.description = 'Gem that allows you to publish any file to Artifactory, for usage please refer to https://github.com/federicomaffei/artifactory-dep'
  s.summary = 'Gem to publish files to artifactory'
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','artifactory-dep.rdoc']
  s.rdoc_options << '--title' << 'artifactory-dep' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'artifactory-dep'
  s.add_development_dependency('dotenv', '~> 0')
  s.add_development_dependency('rake', '~> 0')
  s.add_development_dependency('rdoc', '~> 0')
  s.add_development_dependency('aruba', '~> 0')
  s.add_runtime_dependency('gli','2.13.0')
end
