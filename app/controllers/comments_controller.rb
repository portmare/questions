class CommentsController < ApplicationController
  before_action :authorize!
  before_action :set_answer
  before_action :check_owner, only: [:edit, :update]

  def new
    @comment = @answer.comments.build
  end

  def create
    @comment = @answer.comments.build(comment_params)

    if @comment.save
      redirect_to root_path, notice: 'Правка успешно создана'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      @comment.touch(:confirmed_at)
      redirect_to root_path, notice: 'Правка успешно принята'
    else
      render :edit
    end
  end

  private

  def set_answer
    @answer = Answer.find(params[:answer_id])
  end

  def check_owner
    if @answer && @answer.user != current_user
      redirect_to root_path, notice: 'Нет прав для этой операции'
    else
      @comment = Comment.find(params[:id])
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
