#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PMPracticFunction"
  s.version          = "0.9.8"
  s.summary          = "PMPracticFunction is a collection if Higher order functions that simplify array handling using blocks."
  s.description      = <<-DESC
Ever tired of using NSPredicate ? YES YOU SHOULD BE !

Dynamic api requires non-type-safe access of properties and syntax, not very easy for modern IDEs.
                       DESC
  s.homepage         = "https://github.com/brbulic/PMPracticFunction"
  s.license          = 'MIT'
  s.author           = { "Bruno Bulic" => "brbulic@gmail.com" }
  s.source           = { :git => "https://github.com/brbulic/PMPracticFunction.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/brbulic'

  s.platform     = :ios, '5.1'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  #s.resources = 'Pod/Assets/*.png'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
