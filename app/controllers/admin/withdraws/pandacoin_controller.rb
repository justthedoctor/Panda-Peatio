module Admin
  module Withdraws
    class PandacoinsController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Pandacoin'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_pandacoins = @pandacoins.with_aasm_state(:accepted).order("id DESC")
        @all_pandacoins = @pandacoins.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @pandacoin.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @pandacoin.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
