require './lib/s3gzip/version'

Gem::Specification.new do |s|
  s.name        = "s3gzip"
  s.authors     = ["Troy Howard"]
  s.email       = "thoward37@gmail.com"
  s.license     = 'Apache 2.0'
  s.homepage    = "http://github.com/thoward/s3gzip"
  s.summary     = "Read and write gziped content in S3 without hitting disk."
  s.description = ""

  s.version     = S3Gzip::Version
  s.date        = Time.now.strftime('%Y-%m-%d')
  s.has_rdoc    = false
  s.files       = %w( README.md LICENSE )
  s.files      += Dir.glob('lib/**/*')
  s.require_paths = ["lib"]

  s.rubygems_version = "1.8.23"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<aws-sdk>, ["~> 1.66.0"])
      s.add_runtime_dependency(%q<s3io>, ["~> 1.0.0"])
    else
      s.add_runtime_dependency(%q<aws-sdk>, ["~> 1.66.0"])
      s.add_runtime_dependency(%q<s3io>, ["~> 1.0.0"])
    end
  else
    s.add_runtime_dependency(%q<aws-sdk>, ["~> 1.66.0"])
    s.add_runtime_dependency(%q<s3io>, ["~> 1.0.0"])
  end
end
