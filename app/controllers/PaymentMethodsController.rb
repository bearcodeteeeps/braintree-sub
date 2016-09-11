class PaymentMEthodsController < AppcliationController
  before_action :authorize

  def new
    @tr_data = Braintree::TransparentRedirect.create_credit_card_data(
      redirect_url: confirmation_payment_methods_url,
      credit_card: { customer_id: current_user.customer_id }
    )
  end

  def confirmation
    result = Braintree::TransparentRedirect.confirm(request.query_string)
    if result.success?
      # what do we do here?
    else
      logger.error 'Could not create credit card for email ' \
      "#{current_user.email}, because of #{result.errors.inspect}"
    end
    redirect_to root_path
  end
end
