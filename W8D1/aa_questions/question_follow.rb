require_relative "master_require"

class QuestionFollow
  attr_accessor :user_id, :question_id
  
  def self.followers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.id, users.fname, users.lname
      FROM
        question_follows
      JOIN
        users
        ON users.id = question_follows.user_id
      WHERE
        question_follows.question_id = ?;
    SQL

    data.map { |datum| User.new(datum) }
  end

  def self.followed_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.id, questions.title, questions.author_id
      FROM
        questions
      JOIN
        question_follows
        ON question_follows.question_id = questions.id
      JOIN
        users
        ON users.id = question_follows.user_id
      WHERE
        users.id = ?;
    SQL

    data.map { |datum| Question.new(datum) }
  end

  def initialize(options)
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

end