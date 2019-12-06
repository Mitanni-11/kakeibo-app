class FixedCostsController < ApplicationController
  def index
    @fixed_costs = FixedCost.order(created_at: :asc)
  end

  def show
    @fixed_cost = FixedCost.find(params[:id])
  end

  def new
    @fixed_cost = FixedCost.new()
  end

  def edit
    @fixed_cost = FixedCost.find(params[:id])
  end

  def create
    @fixed_cost = FixedCost.new(params[:fixed_cost])
    if @fixed_cost.save
      redirect_to @fixed_cost, notice: "固定費科目を登録しました"
    else
      render "new"
    end

  end

  def update
    @fixed_cost = FixedCost.find(params[:id])
    @fixed_cost.assign_attributes(params[:fixed_cost])
    if @fixed_cost.save
      redirect_to @fixed_cost, notice: "固定費科目を登録しました"
    else
      render "new"
    end


  end

  def destroy
    @fixed_cost = FixedCost.find(params[:id])
    @fixed_cost.destroy
    redirect_to :fixed_costs, notice: "科目を削除しました。"
  end
end
