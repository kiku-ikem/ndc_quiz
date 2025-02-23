class GamesController < ApplicationController
  def start
    session[:question_number] = 1
    session[:correct_count]   = 0
    session[:book_ids]        = []  # 出題された本のIDを保存する配列
    redirect_to question_games_path
  end

  def question
    session[:question_number] ||= 1
    if session[:question_number] > 5
      redirect_to result_games_path and return
    end

    @question_number = session[:question_number]
    already_used_ids = session[:book_ids] || []
    available_books = Book.where.not(id: already_used_ids)

    if available_books.exists?
      @book = available_books.order("RANDOM()").first
    else
      @book = Book.order("RANDOM()").first
    end

    @show_details = false
    # ※ session[:book_ids] の更新は answer アクションに移す
  end

  def answer
    if request.post?
      Rails.logger.debug "Received answer: #{params[:answer]}"
      @user_answer     = params[:answer]
      @question_number = params[:question_number].to_i
      @book            = Book.find(params[:book_id])
      
      correct = (@user_answer.to_s == @book.ndc1.to_s)
      session[:correct_count] ||= 0
      session[:correct_count] += 1 if correct
      
      # ここで回答済みの本を記録（重複しないように）
      session[:book_ids] ||= []
      session[:book_ids] << @book.id unless session[:book_ids].include?(@book.id)
      
      session[:question_number] = @question_number + 1
      session[:last_answer] = {
        user_answer: @user_answer,
        question_number: @question_number,
        book_id: @book.id,
        correct: correct
      }
      render :answer
    else
      last = session[:last_answer]
      if last.present? && last[:book_id].present?
        @user_answer     = last[:user_answer]
        @question_number = last[:question_number]
        @book            = Book.find_by(id: last[:book_id])
        @correct         = last[:correct]
        redirect_to question_games_path and return unless @book
      else
        redirect_to question_games_path and return
      end
      render :answer
    end
  end

  def result
    @books = session[:book_ids].map { |id| Book.find(id) }
    @correct_count = session[:correct_count] || 0
  end
end
