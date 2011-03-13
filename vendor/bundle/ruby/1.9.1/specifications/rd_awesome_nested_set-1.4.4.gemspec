# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rd_awesome_nested_set}
  s.version = "1.4.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brandon Keepers", "Daniel Morrison"]
  s.date = %q{2010-08-03}
  s.description = %q{An awesome nested set implementation for Active Record}
  s.email = %q{info@collectiveidea.com}
  s.files = ["test/fixtures/categories.yml", "test/fixtures/departments.yml", "test/fixtures/notes.yml", "test/db/database.yml", "test/fixtures/category.rb", "test/application.rb", "test/awesome_nested_set/helper_test.rb", "test/test_helper.rb", "test/db/schema.rb", "test/awesome_nested_set_test.rb"]
  s.homepage = %q{http://github.com/railsdog/awesome_nested_set}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.0}
  s.summary = %q{An awesome nested set implementation for Active Record}
  s.test_files = ["test/fixtures/categories.yml", "test/fixtures/departments.yml", "test/fixtures/notes.yml", "test/db/database.yml", "test/fixtures/category.rb", "test/application.rb", "test/awesome_nested_set/helper_test.rb", "test/test_helper.rb", "test/db/schema.rb", "test/awesome_nested_set_test.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 1.1"])
    else
      s.add_dependency(%q<activerecord>, [">= 1.1"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 1.1"])
  end
end
