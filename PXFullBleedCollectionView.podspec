Pod::Spec.new do |s|
  s.name             = "PXFullBleedCollectionView"
  s.version          = "0.1.2"
  s.summary          = "Full bleed header for a collection view."
  s.description      = <<-DESC
                       It resizes as you scroll!
                       DESC
  s.homepage         = "https://github.com/pixio/PXFullBleedCollectionView"
  s.license          = 'MIT'
  s.author           = { "Daniel Blakemore" => "DanBlakemore@gmail.com" }
  s.source = {
   :git => "https://github.com/pixio/PXFullBleedCollectionView.git",
   :tag => s.version.to_s
  }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'PXFullBleedCollectionView' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
