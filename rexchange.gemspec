# Gem::Specification for rexchange
 
Gem::Specification.new do |s|
  s.name = %q{rexchange}
  s.version = "0.4.0"
 
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mark Lussier"]
  s.date = %q{2008-07-28}
  s.description = %q{An easy to use communication wrapper for Microsoft Eschange Server WebDAV}
  s.email = %q{mlussier (at) gmail (dot) com}
  s.extra_rdoc_files = ["CHANGELOG", "MIT-LICENSE", "README.rdoc"]
  s.files = ["CHANGELOG", "MIT-LICENSE", "RAKEFILE", "README.rdoc", "lib/**/*.rb", "rexchange.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/intabulas/rexchange}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Nifty-generators", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rexchange}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{An easy to use communication wrapper for Microsoft Eschange Server WebDAV}
  s.test_files = ["test/functional.rb"]
 
  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2
 
    if current_version >= 3 then
    else
    end
  else
  end
end
 
