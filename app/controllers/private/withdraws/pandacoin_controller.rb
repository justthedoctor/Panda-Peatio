module Private::Withdraws
  class PandacoinsController < ::Private::Withdraws::BaseController
    include ::Withdraws::Withdrawable
  end
end
