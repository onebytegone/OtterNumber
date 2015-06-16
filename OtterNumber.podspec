Pod::Spec.new do |s|
  s.name        = "OtterNumber"
  s.version     = "0.0.1"
  s.summary     = "Configurable pseudorandom number generator Swift"
  s.homepage    = "https://github.com/onebytegone/OtterNumber"
  s.license     = { :type => "MIT" }
  s.authors     = { "Ethan Smith" => "ethan@onebytegone.com" }

  s.requires_arc = true
  s.ios.deployment_target = "8.0"
  s.source   = { :git => "https://github.com/onebytegone/OtterNumber.git", :tag => s.version}
  s.source_files = "OtterNumber/*.swift"
end
