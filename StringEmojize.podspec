Pod::Spec.new do |s|
  s.name     = 'StringEmojize'
  s.version  = '0.1.0'
  s.license  = 'MIT'
  s.summary  = 'Extension of Swift\'s String to convert Emoji Cheat Sheet codes into their Unicode equivalent.'
  s.homepage = 'https://github.com/kylefrost/StringEmojize'
  s.authors  = {'Kyle Frost' => 'kyle@kylefrost.me'}
  s.source   = { :git => 'https://github.com/kylefrost/StringEmojize.git', :tag => 'v0.1.0' }
  s.platform = :ios
  s.source_files = 'StringEmojize'
  s.requires_arc = true

  s.framework = 'UIKit'
end
