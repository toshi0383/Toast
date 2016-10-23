Pod::Spec.new do |s|
  s.name             = "Toast"
  s.version          = "0.1.0"
  s.summary          = "Toast Popup for iOS,tvOS,macOS(OSX)"
  s.description      = <<-DESC
      Yet another Toast library🍞
      Inspired by Toast-Swift, but this one supports multiplatform. That means you can popup Toasts on iOS, tvOS, macOS(OSX), everywhere!
                       DESC
  s.homepage         = "https://github.com/toshi0383/Toast"
  s.license          = 'MIT'
  s.author           = { "Toshihiro Suzuki" => "t.suzuki326@gmail.com" }
  s.source           = { :git => "https://github.com/toshi0383/Toast.git", :tag => s.version.to_s }
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.11"
  if s.respond_to?(:tvos)
    s.tvos.deployment_target = "9.0"
  end
  s.requires_arc = true

  s.source_files = 'Sources/**/*'
  s.license = {
    :type => "MIT",
    :text => <<-LICENSE
      Copyright (c) 2016 Toshihiro Suzuki
      Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
      The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
      THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
    LICENSE
  }
end
