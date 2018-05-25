# frozen-string-literal: true

Gem::Specification.new do |spec|
  spec.name = 'lang_svr'
  spec.version = '0.0.1'
  spec.date = '2018-03-23'
  spec.summary = 'ruby language server'
  spec.description = 'A ruby language server, meeting the specifications of the Microsoft LSP v3.0.'
  spec.authors = ['Bryan Hoekstra']
  spec.email = 'hooky@qrmaster.co.nz'
  spec.files = ['lib/lang-svr.rb']
  spec.homepage = 'https://github.com/HookyQR/ruby-lang-svr'
  spec.license = 'MIT'
  spec.executables << 'ruby-lang-svr'
end
