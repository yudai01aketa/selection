module Api
  module V1
    class IdeasController < ApplicationController
      def index
        if params[:category_name].blank?
          category = Idea.all
          render json: { data: category }
        elsif Category.find_by(name: params[:category_name]).present?
          category = Category.find_by(name: params[:category_name])
          ideas = Idea.where(category_id: category.id)
          render json: { data: ideas }
        else
          render_status(404)
        end
      end

      def create
        if Category.find_by(name: params[:category_name]).present?
          set_current_category
          idea = Idea.new(body: params[:body], category_id: current_category.id)
        elsif params[:category_name].blank?
          idea = Idea.new
        else
          Category.create(category_name: params[:category_name])
          set_current_category
          idea = current_category.ideas.build(body: params[:body])
        end

        if idea.save
          render_status(201)
        else
          render_status(422)
        end
      end

      private

      def set_current_category
        current_category = Category.find_by(name: params[:category_name])
      end
    end
  end
end
