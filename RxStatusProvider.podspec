Pod::Spec.new do |s|
  s.name = "RxStatusProvider"
  s.version = "1.0.2"
  s.summary = "RxSwift extensions for StatusProvider."

  s.description = <<-DESC
        Some Rx extensions for StatusProvider, a protocol to handle initial Loadings, Empty Views and Error Handling in a ViewController & views

                       DESC

  s.homepage = "https://github.com/qiuncheng/RxStatusProvider"
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license = {:type => "MIT", :file => "LICENSE"}
  s.author = {"qiuncheng" => "qiuncheng@gmail.com"}
  s.source = {:git => "https://github.com/qiuncheng/RxStatusProvider.git", :tag => s.version.to_s}
  s.social_media_url = "https://twitter.com/vsccw"

  s.ios.deployment_target = "9.0"
  s.swift_version = "5.0"

  s.source_files = "RxStatusProvider/Classes/**/*"

  s.dependency "StatusProvider"
  s.dependency "RxSwift"
  s.dependency "RxCocoa"
end
