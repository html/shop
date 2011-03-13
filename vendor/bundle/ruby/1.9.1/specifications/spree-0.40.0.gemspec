# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{spree}
  s.version = "0.40.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sean Schofield"]
  s.date = %q{2010-12-22}
  s.description = %q{Spree is an open source e-commerce framework for Ruby on Rails.  Join us on the spree-user google group or in #spree on IRC}
  s.email = %q{sean@railsdog.com}
  s.homepage = %q{http://spreecommerce.com}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.requirements = ["none"]
  s.rubyforge_project = %q{spree}
  s.rubygems_version = %q{1.6.0}
  s.summary = %q{Full-stack e-commerce framework for Ruby on Rails.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<spree_core>, ["= 0.40.0"])
      s.add_runtime_dependency(%q<spree_auth>, ["= 0.40.0"])
      s.add_runtime_dependency(%q<spree_api>, ["= 0.40.0"])
      s.add_runtime_dependency(%q<spree_dash>, ["= 0.40.0"])
      s.add_runtime_dependency(%q<spree_sample>, ["= 0.40.0"])
      s.add_runtime_dependency(%q<spree_promo>, ["= 0.40.0"])
    else
      s.add_dependency(%q<spree_core>, ["= 0.40.0"])
      s.add_dependency(%q<spree_auth>, ["= 0.40.0"])
      s.add_dependency(%q<spree_api>, ["= 0.40.0"])
      s.add_dependency(%q<spree_dash>, ["= 0.40.0"])
      s.add_dependency(%q<spree_sample>, ["= 0.40.0"])
      s.add_dependency(%q<spree_promo>, ["= 0.40.0"])
    end
  else
    s.add_dependency(%q<spree_core>, ["= 0.40.0"])
    s.add_dependency(%q<spree_auth>, ["= 0.40.0"])
    s.add_dependency(%q<spree_api>, ["= 0.40.0"])
    s.add_dependency(%q<spree_dash>, ["= 0.40.0"])
    s.add_dependency(%q<spree_sample>, ["= 0.40.0"])
    s.add_dependency(%q<spree_promo>, ["= 0.40.0"])
  end
end
