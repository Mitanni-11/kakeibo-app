class VariableCostAmountsController < ApplicationController
  def index
    @variable_costs = VariableCost.order(created_at: :asc)
    @variable_cost_amounts = VariableCostAmount.order("year_month asc")
  end

  def show
    @variable_cost_amount = VariableCostAmount.find(params[:id])
  end

  def new
    year_month_day = params[:year_month] + "-01"
    @year_month = year_month_day.to_date

    @variable_costs = VariableCost.order(created_at: :asc)
    @form = Form::VariableCostForm.new
  end

  def edit
    @variable_cost_amount = VariableCostAmount.find(params[:id])
    @variable_cost = VariableCost.find(@variable_cost_amount.variable_cost_id)
  end

  def create
    @form = Form::VariableCostForm.new(variable_cost_form_params)
    if @form.save
      redirect_to :variable_cost_amounts, notice: "登録しました"
    else
      redirect_to :variable_cost_amounts, notice: "登録に失敗しました"
    end
  end

  def variable_cost_form_params
    params.require(:form_variable_cost_form).permit(variable_cost_amounts_attributes: Form::VariableCostAmount::REGISTRABLE_ATTRIBUTES)
  end

  def update
    @variable_cost_amount = VariableCostAmount.find(params[:id])
    @variable_cost_amount.assign_attributes(params[:variable_cost_amount])
    if @variable_cost_amount.save
      redirect_to :variable_cost_amounts, notice: "情報を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @variable_cost_amount = VariableCostAmount.find(params[:id])
    @variable_cost_amount.destroy
    redirect_to :variable_cost_amounts, notice: "データを削除しました。"
  end
end
