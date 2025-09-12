require 'spree_extension'
require 'spree_reviews/engine'
require 'spree_reviews/version'
require 'deface'

module Spree
  module Reviews
    module_function

    def config(*)
      yield(Spree::Reviews::Config)
    end
  end
end
