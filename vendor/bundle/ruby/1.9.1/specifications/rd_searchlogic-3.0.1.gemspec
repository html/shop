# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rd_searchlogic}
  s.version = "3.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ben Johnson of Binary Logic", "Roman Smirnov of RailsDog"]
  s.date = %q{2011-01-08}
  s.description = %q{Searchlogic makes using ActiveRecord named scopes easier and less repetitive.}
  s.email = %q{bjohnson@binarylogic.com}
  s.files = ["spec/searchlogic/active_record/consistency_spec.rb", "spec/searchlogic/active_record/association_proxy_spec.rb", "spec/searchlogic/named_scopes/ordering_spec.rb", "spec/searchlogic/named_scopes/association_ordering_spec.rb", "spec/searchlogic/named_scopes/or_conditions_spec.rb", "spec/searchlogic/named_scopes/association_conditions_spec.rb", "spec/searchlogic/named_scopes/conditions_spec.rb", "spec/searchlogic/named_scopes/alias_scope_spec.rb", "spec/searchlogic/core_ext/proc_spec.rb", "spec/searchlogic/core_ext/object_spec.rb", "spec/searchlogic/search_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/railsdog/searchlogic}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{searchlogic}
  s.rubygems_version = %q{1.6.0}
  s.summary = %q{Searchlogic makes using ActiveRecord named scopes easier and less repetitive.}
  s.test_files = ["spec/searchlogic/active_record/consistency_spec.rb", "spec/searchlogic/active_record/association_proxy_spec.rb", "spec/searchlogic/named_scopes/ordering_spec.rb", "spec/searchlogic/named_scopes/association_ordering_spec.rb", "spec/searchlogic/named_scopes/or_conditions_spec.rb", "spec/searchlogic/named_scopes/association_conditions_spec.rb", "spec/searchlogic/named_scopes/conditions_spec.rb", "spec/searchlogic/named_scopes/alias_scope_spec.rb", "spec/searchlogic/core_ext/proc_spec.rb", "spec/searchlogic/core_ext/object_spec.rb", "spec/searchlogic/search_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 3.0.0"])
    else
      s.add_dependency(%q<activerecord>, [">= 3.0.0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 3.0.0"])
  end
end
