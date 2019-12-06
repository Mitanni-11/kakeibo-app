class IncomeAmountsController < ApplicationController
  def index
    @incomes = Income.order(created_at: :asc)
    @income_amounts = IncomeAmount.order("year_month asc")
  end

  def show
    @income_amount = IncomeAmount.find(params[:id])
  end

  def new
    year_month_day = params[:year_month] + "-01"
    @year_month = year_month_day.to_date

    @incomes = Income.order(created_at: :asc)
    @form = Form::IncomeForm.new
  end

  def edit
    @income_amount = IncomeAmount.find(params[:id])
    @income = Income.find(@income_amount.income_id)
  end

  def create
    @form = Form::IncomeForm.new(income_form_params)
    if @form.save
      redirect_to :income_amounts, notice: "登録しました"
    else
      redirect_to :income_amounts, notice: "登録に失敗しました"
    end
  end

  def income_form_params
    params.require(:form_income_form).permit(income_amounts_attributes: Form::IncomeAmount::REGISTRABLE_ATTRIBUTES)
  end

  def update
    @income_amount = IncomeAmount.find(params[:id])
    @income_amount.assign_attributes(params[:income_value])
    if @income_amount.save
      redirect_to :income_amounts, notice: "情報を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @income_amount = IncomeAmount.find(params[:id])
    @income_amount.destroy
    redirect_to :income_amounts, notice: "データを削除しました。"
  end

end
