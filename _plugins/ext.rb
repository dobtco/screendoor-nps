require 'jekyll-assets'
require 'sprockets'
require 'dvl/core'

# Add assets to load path
Sprockets.append_path Gem.loaded_specs['dvl-core'].full_gem_path
