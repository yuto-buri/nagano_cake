class Admins::HomesController < ApplicationController
  def top
    @today_count = Order.where(created_at: Time.zone.now.all_day).count
  end
end
