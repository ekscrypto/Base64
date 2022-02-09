Pod::Spec.new do |s|
  s.name     = 'Base64'
  s.version  = '1.2.0'
  s.license  = 'Public Domain'
  s.summary  = 'RFC 4648 Base64 implementation in Objective-C ARC.'
  s.homepage = 'https://github.com/ekscrypto/Base64'
  s.author   = { 'Dave Poirier' => 'ekscrypto@gmail.com' }
  s.source   = { :git => 'https://github.com/ekscrypto/Base64.git', :tag => '1.2.0' }
  s.source_files = 'Base64/MF_Base64Additions.m','Base64/MF_Base64Additions.h'
  s.requires_arc = true
end
