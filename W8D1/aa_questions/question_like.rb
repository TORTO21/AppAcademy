require_relative "master_require"

class QuestionLike
  attr_accessor :user_id, :question_id
  
  def initialize(options)
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end