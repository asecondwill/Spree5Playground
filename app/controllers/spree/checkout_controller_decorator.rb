module Spree
  module CheckoutControllerDecorator
   

    def update
      puts "*************** UPDATE *******"
      # No need to manually set the source attributes anymore
      super
    end

    def permitted_checkout_attributes
      super + [
        :purchase_order_number,
        payments_attributes: [
          :payment_method_id,         
          { source_attributes: [:purchase_order_number, :organization_name] }
        ]
      ]
    end
  end
end

Spree::CheckoutController.prepend(Spree::CheckoutControllerDecorator)