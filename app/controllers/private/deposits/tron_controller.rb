module Private
  module Deposits
    class TronController < ::Private::Deposits::BaseController
      include ::Deposits::CtrlCoinable
    end
  end
end
