class VariableCostsController < ApplicationController
  def index
    @variable_costs = VariableCost.order(created_at: :asc)
  end

  def show
    @variable_cost = VariableCost.find(params[:id])
  end

  def new
    @variable_cost = VariableCost.new()
  end

  def edit
    @variable_cost = VariableCost.find(params[:id])
  end

  def create
    @variable_cost = VariableCost.new(params[:variable_cost])
    if @variable_cost.save
      redirect_to @variable_cost, notice: "変動費科目を登録しました"
    else
      render "new"
    end

  end

  def update
    @variable_cost = VariableCost.find(params[:id])
    @variable_cost.assign_attributes(params[:variable_cost])
    if @variable_cost.save
      redirect_to @variable_cost, notice: "変動費科目を登録しました"
    else
      render "new"
    end
  end

  def destroy
    @variable_cost = VariableCost.find(params[:id])
    @variable_cost.destroy
    redirect_to :variable_costs, notice: "科目を削除しました。"
  end
end
