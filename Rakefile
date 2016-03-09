require 'html/proofer'

task :test do
  sh 'bundle exec jekyll build'
  HTML::Proofer.new(
    './_site',
    disable_external: true,
    checks_to_ignore: %w(ImageCheck),
    check_html: true
  ).run
end
