# frozen_string_literal: true

class SubscribersController < ApplicationController
  include PaginationMethods

  ##
  # GET /api/subscribers
  def index
    # Added sort to ensure the same order is maintained even after updates are made
    subscribers = Subscriber.all.sort_by { |subscriber| subscriber.id }

    total_records = subscribers.count
    limited_subscribers = subscribers[offset...(offset+limit)]

    render json: {subscribers: limited_subscribers, pagination: pagination(total_records)}, formats: :json
  end

  def create
    @subscriber = Subscriber.create(email: params[:email].downcase, name: params[:name], isSubscribed: true)
    @subscriber.save!
    render json: {message: "Subscriber created successfully"}, formats: :json, status: :created
  end

  def update
    @subscriber = Subscriber.find_by(id: params[:id])
    @subscriber.update(isSubscribed: params[:isSubscribed])
    @subscriber.save!
    render json: {message: "Subscriber updated successfully"}, formats: :json, status: :ok
  end
end
