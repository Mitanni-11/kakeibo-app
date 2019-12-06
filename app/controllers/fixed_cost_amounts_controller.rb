class FixedCostAmountsController < ApplicationController
  def index
    @fixed_costs = FixedCost.order(created_at: :asc)
    @fixed_cost_amounts = FixedCostAmount.order("year_month asc")
  end

  def show
    @fixed_cost_amount = FixedCostAmount.find(params[:id])
  end

  def new
    year_month_day = params[:year_month] + "-01"
    @year_month = year_month_day.to_date

    @fixed_costs = FixedCost.order(created_at: :asc)
    @form = Form::FixedCostForm.new
  end

  def edit
    @fixed_cost_amount = FixedCostAmount.find(params[:id])
    @fixed_cost = FixedCost.find(@fixed_cost_amount.fixed_cost_id)
  end

  def create
    @form = Form::FixedCostForm.new(fixed_cost_form_params)
    if @form.save
      redirect_to :fixed_cost_amounts, notice: "登録しました"
    else
      redirect_to :fixed_cost_amounts, notice: "登録に失敗しました"
    end
  end

  def fixed_cost_form_params
    params.require(:form_fixed_cost_form).permit(fixed_cost_amounts_attributes: Form::FixedCostAmount::REGISTRABLE_ATTRIBUTES)
  end

  def update
    @fixed_cost_amount = FixedCostAmount.find(params[:id])
    @fixed_cost_amount.assign_attributes(params[:fixed_cost_amount])
    if @fixed_cost_amount.save
      redirect_to :fixed_cost_amounts, notice: "情報を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @fixed_cost_amount = FixedCostAmount.find(params[:id])
    @fixed_cost_amount.destroy
    redirect_to :fixed_cost_amounts, notice: "データを削除しました。"
  end
end
