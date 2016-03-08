Pod::Spec.new do |s|

  s.name         = "BRCybertron"
  s.version      = "0.1.0"
  s.summary      = "Objective-C XSLT processor."
  s.description  = <<-DESC
                   This project provides a way to run XSLT transformations on XML
				   documents, using `libxslt`.
                   DESC

  s.homepage     = "https://github.com/Blue-Rocket/BRCybertron"
  s.license      = "MIT"
  s.author       = { "Matt Magoffin" => "matt@bluerocket.us" }

  s.ios.deployment_target = "7.1"

  s.source       = { :git => "https://github.com/Blue-Rocket/BRCybertron.git",
  					 :tag => s.version.to_s, :submodules => true }

  s.libraries	 = 'xml2'
  s.xcconfig     = { 'HEADER_SEARCH_PATHS' => '"$(SDKROOT)/usr/include/libxml2"',  }

  s.requires_arc = true

  s.default_subspec = 'Core'

  s.subspec 'libxslt' do |as|
	as.xcconfig = {
		'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/Headers/Private/BRCybertron/BRCybertron/libxslt" ' +
								'"${PODS_ROOT}/Headers/Private/BRCybertron/libxslt"'
	}
	as.header_mappings_dir = '.'
  	as.requires_arc = false
	as.source_files = "BRCybertron/libxslt/**/*.h",
					  "libxslt/libxslt/*.{h,c}",
					  "libxslt/libexslt/*.{h,c}"
	as.private_header_files = "**/*.h"
  end

  s.subspec 'Core' do |as|
	  as.dependency 'BRCybertron/libxslt'
	  as.source_files = "BRCybertron/BRCybertron/*.{h,m}",
						"BRCybertron/Packaging/*.h"
  end

end