Pod::Spec.new do |s|
    s.name                 = "DLParser"
    s.version              = "1.0.0"
    s.license              = { :type => "MIT", :file => "LICENSE" }
    s.author               = { "ajohnson" => "ajohnson388@gmail.com" }
    s.homepage             = "https://github.com/ajohnson388/DLParser-Swift"
    s.summary              = "A barcode parsing library for AAMVA compliant driver licenses."
    s.description          = "A Swift library for parsing driver licenses that are AAMVA compliant. This library is designed to cover all versions and fields supported by AAMVA."
    s.source               = { :git => "https://github.com/ajohnson388/DLParser-Swift.git", :tag => "#{s.version}" }
    s.source_files         = "DLParser", "DLParser/**/*.{h,m,swift}"
    s.pod_target_xcconfig  = { 'SWIFT_VERSION' => '4.0' }
    s.swift_version        = "4.0"
    s.platform             = :ios, "9.0"
end
