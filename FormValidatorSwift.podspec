Pod::Spec.new do |s|
  s.name = 'FormValidatorSwift'
  s.version = '3.2.0'
  s.license = { :type => "MIT", :file => "License.md" }
  s.summary = 'A framework to validate inputs of text fields and text views in a convenient way.'
  s.homepage = 'https://github.com/ustwo/formvalidator-swift'
  s.authors = { 'Shagun Madhikarmi' => 'shagun@ustwo.com',
                'Aaron McTavish' => 'aamct@ustwo.com' }
  s.source = { :git => 'https://github.com/ustwo/formvalidator-swift.git', :tag => s.version }

  s.ios.deployment_target = '8.3'
  s.tvos.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'

  s.source_files = 'Sources/**/*.swift'
  s.ios.exclude_files = '**/*AppKit.swift'
  s.tvos.exclude_files = '**/*AppKit.swift'
  s.osx.exclude_files = '**/*UIKit.swift'

  s.resource_bundles = { 'FormValidatorSwift' => 'Sources/Resources/**/*.strings' }

  s.frameworks = 'Foundation'
  s.ios.frameworks = 'UIKit'
  s.tvos.frameworks = 'UIKit'
  s.osx.frameworks = 'AppKit'

  s.requires_arc = true
end
