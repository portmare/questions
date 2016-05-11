class QuestionsController < ApplicationController
  before_action :authorize!, except: :index

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to root_path, notice: 'Вопрос успешно добавлен'
    else
      render :new
    end
  end

  private 

  def question_params
    params.require(:question).permit(:title, :body).merge(user: current_user)
  end
end
