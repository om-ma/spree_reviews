module Spree
  module ProductsControllerDecorator
    def self.prepended(base)
      base.helper Spree::ReviewsHelper
    end

    def reviews
      @product = Spree::Product.friendly.find(params[:product_id])
      respond_to do |format|
        format.html do
          render inline: <<~HTML
            <turbo-frame id="reviews_frame">
              <%= render "spree/shared/reviews", product: @product %>
            </turbo-frame>
          HTML
        end
      end
    end

    ::Spree::ProductsController.prepend self if ::Spree::Core::Engine.frontend_available? && ::Spree::ProductsController.included_modules.exclude?(self)
  end
end
