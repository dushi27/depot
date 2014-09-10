require 'time'

class AdminController < ApplicationController
  def index
    @total_orders = Order.count
    @ordersByDate = Order.where('created_at >= :three_weeks_ago', :three_weeks_ago => 3.weeks.ago.at_midnight).group("Date(created_at)").count
    #@startDate = @ordersByDate.keys[0]
    @startDate = Time.parse(@ordersByDate.keys[0].to_s).utc.to_i*1000
    @data = Array.new()
    @ordersByDate.each {|key,value| @data << value}
  end
end
