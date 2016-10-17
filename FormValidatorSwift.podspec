Pod::Spec.new do |s|
  s.name = 'FormValidatorSwift'
  s.version = '1.0.0'
  s.license = { :type => "MIT", :file => "License.md" }
  s.summary = 'An organizational tool for writing custom view controllers using UIKit.'
  s.homepage = 'https://github.com/ustwo/formvalidator-swift'
  s.authors = { 'Shagun Madhikarmi' => 'shagun@ustwo.com',
                'Aaron McTavish' => 'aamct@ustwo.com',
                'Martin Stolz' => 'martin@ustwo.com' }
  s.source = { :git => 'https://github.com/ustwo/formvalidator-swift.git', :tag => s.version }

  s.ios.deployment_target = '8.3'
  s.tvos.deployment_target = '9.0'

  s.source_files = 'Sources/**/*.swift'

  s.resource_bundles = { 'FormValidatorSwift' => 'Sources/Resources/**/*.strings' }

  s.frameworks = 'Foundation', 'UIKit'

  s.requires_arc = true
end
