Gem::Specification.new do |s|
  s.name        = 'grabmoot'
  s.version     = '0.0.3'
  s.executables << 'grabmoot'
  s.date        = '2012-06-09'
  s.summary     = "Grab images from a 4chan thread"
  s.description = "A CLI app that will assist in grabbing all images from a given thread"
  s.authors     = ["enroxorz"]
  s.email       = 'enrique.j.matta@gmail.com'
  s.files       = ["lib/grabmoot.rb"]
  s.homepage    = 'https://github.com/enriquem/grabmoot'
  s.add_development_dependency "nokogiri", ">= 1.5.3"
  s.add_runtime_dependency "nokogiri", ">= 1.5.3"
  s.requirements << 'nokogiri, v1.5.3'
  s.license = 'BSD'
  s.required_ruby_version = '>= 1.9.2'
end