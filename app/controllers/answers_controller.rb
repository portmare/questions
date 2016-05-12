class AnswersController < ApplicationController
  before_filter :authorize!
  before_action :set_question

  def new
    @answer = @question.answers.build
  end

  def create
    @answer = @question.answers.build(answer_params)

    if @answer.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Ответ успешно создан' }
        format.js
      end
    else
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body).merge(user: current_user)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end
end
