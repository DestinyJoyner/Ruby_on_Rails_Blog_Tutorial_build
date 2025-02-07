# Pagy initializer file
# See https://ddnexus.github.io/pagy/api/pagy#configuration

# No need for require 'pagy/extras/tailwind'

# Basic configs
Pagy::DEFAULT[:items] = 10    # items per page
Pagy::DEFAULT[:size]  = 5     # number of page links to show


# require 'pagy/extras/tailwind'