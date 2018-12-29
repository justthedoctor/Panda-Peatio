module Deposits
  class Tron < ::Deposit
    include ::AasmAbsolutely
    include ::Deposits::Coinable
  end
end
