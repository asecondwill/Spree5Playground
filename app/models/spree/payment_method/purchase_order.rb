#app/models/spree/payment_method/purchase_order.rb
module Spree
  class PaymentMethod::PurchaseOrder < PaymentMethod
    def partial_name
      'purchase_order'
    end

    def payment_source_class
      puts "**** payment_source_class *****"
      Spree::PurchaseOrder
    end

    # def create_source(params)
    #   puts "******* CREATE SOURCE *******"
    #   puts "Params: #{params.inspect}"
      
    #   Spree::PurchaseOrder.create!(
    #     purchase_order_number: params[:purchase_order_number],
    #     payment_method_id: id
    #   )
    # end

    # def authorize(amount, source, options = {})
    #   puts "**** authorize *****"
    #    puts "Amount: #{amount}"
    #   puts "Source: #{source.inspect}"
    #   puts "Options: #{options.inspect}"
      
    #   # Link the source to the order if possible
    #   if options[:order_id].present? && source.respond_to?(:order_id=)
    #     puts "**** Updating the order_id #{options[:order_id]}"
        
    #     # Find the actual order by number and get its ID
    #     order_number = options[:order_id].to_s
    #     order = Spree::Order.find_by(number: order_number)
        
    #     if order
    #       puts "**** Found order with ID: #{order.id}"
    #       source.update_column(:order_id, order.id)
    #     else
    #       puts "**** Could not find order with number: #{order_number}"
    #     end
    #   else
    #     puts "**** no options[:order_id]"
    #   end
      
    #   # Always return a successful response to proceed with checkout
    #   simulated_successful_billing_response('Purchase Order: Success')
    # end

    def purchase(amount, source, options = {})
      puts "**** purchase *****"
      puts "Amount: #{amount}"
      puts "Source: #{source.inspect}"
      puts "Options: #{options.inspect}"
      
      # Ensure order_id is set
      # if options[:order_id].present? && source.respond_to?(:order_id=)
      #   order_number = options[:order_id].to_s
      #   order = Spree::Order.find_by(number: order_number)
        
      #   if order
      #     puts "**** Found order with ID: #{order.id}"
      #     source.update_column(:order_id, order.id)
      #   else
      #     puts "**** Could not find order with number: #{order_number}"
      #   end
      # end
      simulated_successful_billing_response('Purchase Order: Purchased')
    end

    

    # def void(*args)
    #   puts "**** void *****"
    #   simulated_successful_billing_response
    # end

    def source_required?
      true
    end

    def auto_capture?
      true
    end

    # def supports?(source)
    #   source.is_a?(Spree::PurchaseOrder) || source.nil?
    # end

    #This tells Spree the payment isn't immediately settled
    def stores_customer_profiles?
      false
    end

    private

    def simulated_successful_billing_response(message = "")
      ActiveMerchant::Billing::Response.new(true, message, {}, {})
    end
  end
end