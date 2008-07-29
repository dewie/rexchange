#!/usr/bin/env ruby

require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/gempackagetask'


PACKAGE_VERSION = '0.4.0'

PACKAGE_FILES = FileList[
  'README.rdoc',
  'CHANGELOG',
  'RAKEFILE',
  'MIT-LICENSE',
  'lib/**/*.rb',
  'test/*.rb'
].to_a

PROJECT = 'rexchange'

task :default => [:rdoc]

desc 'Generate Documentation'
rd = Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title = "RExchange -- A simple wrapper around Microsoft Exchange Server's WebDAV API"
  rdoc.options << '--line-numbers' << '--inline-source' << '--main' << 'README.rdoc'
  rdoc.rdoc_files.include(PACKAGE_FILES)
end

gem_spec = Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = PROJECT
  s.summary = "A simple wrapper around Microsoft Exchange Server's WebDAV API"
  s.description = "Connect, browse, and iterate through folders and messages on an Exchange Server"
  s.version = PACKAGE_VERSION
  
  s.authors = 'Sam Smoot', 'Scott Bauer', 'Mark Lussier'
  s.email = 'ssmoot@gmail.com; bauer.mail@gmail.com; mlussier@gmail.com'
  s.rubyforge_project = PROJECT
  s.homepage = 'http://rexchange.lighthouseapp.com/projects/14809-rexchange/overview'
  #s.homepage = 'http://substantiality.net'
  
  s.files = PACKAGE_FILES
  
  s.require_path = 'lib'
  s.requirements << 'none'
  s.autorequire = 'rexchange'
  
  s.has_rdoc = true
  s.rdoc_options << '--line-numbers' << '--inline-source' << '--main' << 'README.rdoc'
  s.extra_rdoc_files = rd.rdoc_files.reject { |fn| fn =~ /\.rb$/ }.to_a
end

Rake::GemPackageTask.new(gem_spec) do |p|
  p.gem_spec = gem_spec
  p.need_tar = true
  p.need_zip = true
end


Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*.rb']
  t.verbose = true
end