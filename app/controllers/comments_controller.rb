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
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Правка успешно создана' }
        format.js
      end
    else
      render :new
    end
  end

  def edit
    @comment.body = "#{@comment.answer.body} #{@comment.body}"
  end

  def update
    @comment.touch(:confirmed_at)
    redirect_to root_path, notice: 'Правка успешно принята'
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
    params.require(:comment).permit(:body).merge(user: current_user)
  end
end
