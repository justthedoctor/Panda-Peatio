module Admin
  module Withdraws
    class TronsController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Tron'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_Trons = @Trons.with_aasm_state(:accepted).order("id DESC")
        @all_Trons = @Trons.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @Tron.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @Tron.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
