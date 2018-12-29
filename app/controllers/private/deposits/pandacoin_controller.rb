module Private
  module Deposits
    class PandacoinController < ::Private::Deposits::BaseController
      include ::Deposits::CtrlCoinable
    end
  end
end
