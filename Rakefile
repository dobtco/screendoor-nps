require 'html-proofer'

task :test do
  sh 'bundle exec jekyll build'
  HTMLProofer.check_directory(
    './_site',
    disable_external: true,
    check_html: true,
    allow_hash_href: true
  ).run
end
