Pod::Spec.new do |s|

  s.name        = "Redstone"
  s.version     = "0.3.0"
  s.summary     = "Redstone has a State Machine."

  s.description = <<-DESC
                   Redstone has a simple State Machine.
                   DESC

  s.homepage    = "https://github.com/nixzhu/Redstone"

  s.license     = { :type => "MIT", :file => "LICENSE" }

  s.authors           = { "nixzhu" => "zhuhongxu@gmail.com" }
  s.social_media_url  = "https://twitter.com/nixzhu"

  s.ios.deployment_target   = "8.0"

  s.source          = { :git => "https://github.com/nixzhu/Redstone.git", :tag => s.version }
  s.source_files    = "Redstone/*.swift"
  s.requires_arc    = true

end
