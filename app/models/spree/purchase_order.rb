# app/models/spree/purchase_order.rb
module Spree
  class PurchaseOrder < Spree::Base
    belongs_to :payment_method
    belongs_to :order, class_name: 'Spree::Order', optional: true
    has_many :payments, as: :source

    validates :purchase_order_number, presence: true

    def actions
      %w(complete void)
    end

    # def process!(payment)
    #   # Update order_id when payment is processed
    #   update_column(:order_id, payment.order_id) if payment.order_id.present?
    #   true
    # end

    # def complete!(payment)
    #   payment.complete!
    # end

    # def void!(payment)
    #   payment.void!
    # end
    

    # Indicates whether its possible to complete the payment
    # def can_complete?(payment)
    #   payment.pending? || payment.checkout?
    # end

    def can_capture?(payment)
      payment.pending? || payment.checkout?
    end

    # Indicates whether its possible to void the payment.
    def can_void?(payment)
      !payment.failed? && !payment.void?
    end
  end
end