# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{legebiltzarra}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aitor Garc\303\255a"]
  s.date = %q{2009-05-23}
  s.description = %q{TODO}
  s.email = %q{aitor.garcia@gmail.com}
  s.files = ["VERSION.yml", "lib/legebiltzarra", "lib/legebiltzarra/legislature.rb", "lib/legebiltzarra/parliamentarian.rb", "lib/legebiltzarra/search.rb", "lib/legebiltzarra.rb", "spec/legislature_spec.rb", "spec/parliamentarian_spec.rb", "spec/samples", "spec/samples/l07.html", "spec/samples/lga.html", "spec/samples/sample_parliamentarian.html", "spec/search_spec.rb", "spec/spec.opts", "spec/spec_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/probono/legebiltzarra}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
