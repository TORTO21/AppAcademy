require "sqlite3"
require "singleton"

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end

end


# class User
#   attr_accessor :id, :fname, :lname
  
#   def self.find_by_id(id)
#     data = QuestionsDatabase.instance.execute(<<-SQL, id)
#       SELECT
#         *
#       FROM
#         users
#       WHERE
#         id = ?;
#     SQL

#     User.new(data.first)
#   end

#   def self.find_by_name(fname, lname)
#     data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
#       SELECT
#         *
#       FROM
#         users
#       WHERE
#         fname = ?
#         AND
#         lname = ?;
#     SQL

#     User.new(data.first)
#   end

#   def initialize(options)
#     @id = options['id']
#     @fname = options['fname']
#     @lname = options['lname']
#   end

#   def authored_questions
#     Question.find_by_author_id(@id)
#   end

#   def authored_replies
#     Reply.find_by_user_id(@id)
#   end

#   def followed_questions
#     QuestionFollow.followed_questions_for_user_id(@id)
#   end

# end


# class Question
#   attr_accessor :id, :title, :author_id
  
#   def self.find_by_id(id)
#     data = QuestionsDatabase.instance.execute(<<-SQL, id)
#       SELECT
#         *
#       FROM
#         questions
#       WHERE
#         id = ?;
#     SQL

#     Question.new(data.first)
#   end

#   def self.find_by_author_id(author_id)
#     data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
#       SELECT
#         *
#       FROM
#         questions
#       WHERE
#         author_id = ?;
#     SQL

#     data.map { |datum| Question.new(datum) }
#   end

#   def initialize(options)
#     @id = options['id']
#     @title = options['title']
#     @author_id = options['author_id']
#     @body = options['body']
#   end

#   def author
#     User.find_by_id(@author_id)
#   end

#   def replies
#     Reply.find_by_question_id(@id)
#   end

#   def followers
#     QuestionFollow.followers_for_question_id(@id)
#   end

# end


# class QuestionFollow
#   attr_accessor :user_id, :question_id
  
#   def self.followers_for_question_id(question_id)
#     data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
#       SELECT
#         users.id, users.fname, users.lname
#       FROM
#         question_follows
#       JOIN
#         users
#         ON users.id = question_follows.user_id
#       WHERE
#         question_follows.question_id = ?;
#     SQL

#     data.map { |datum| User.new(datum) }
#   end

#   def self.followed_questions_for_user_id(user_id)
#     data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
#       SELECT
#         questions.id, questions.title, questions.author_id
#       FROM
#         questions
#       JOIN
#         question_follows
#         ON question_follows.question_id = questions.id
#       JOIN
#         users
#         ON users.id = question_follows.user_id
#       WHERE
#         users.id = ?;
#     SQL

#     data.map { |datum| Question.new(datum) }
#   end

#   def initialize(options)
#     @user_id = options['user_id']
#     @question_id = options['question_id']
#   end

# end


# class Reply
#   attr_accessor :id, :question_id, :parent_id, :author_id, :body
  
#   def self.find_by_id(id)
#     data = QuestionsDatabase.instance.execute(<<-SQL, id)
#       SELECT
#         *
#       FROM
#         replies
#       WHERE
#         id = ?;
#     SQL

#     Reply.new(data.first)
#   end

#   def self.find_by_user_id(author_id)
#     data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
#       SELECT
#         *
#       FROM
#         replies
#       WHERE
#         author_id = ?;
#     SQL

#     data.map { |datum| Reply.new(datum) }
#   end

#   def self.find_by_question_id(question_id)
#     data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
#       SELECT
#         *
#       FROM
#         replies
#       WHERE
#         question_id = ?;
#     SQL

#     data.map { |datum| Reply.new(datum) }
#   end

#   def initialize(options)
#     @id = options['id']
#     @question_id = options['question_id']
#     @parent_id = options['parent_id']
#     @author_id = options['author_id']
#     @body = options['body']
#   end

#   def author
#     User.find_by_id(@author_id)
#   end

#   def question
#     Question.find_by_id(@question_id)
#   end

#   def parent_reply
#     raise "This is the first reply in this thread" unless @parent_id
#     Reply.find_by_id(@parent_id)
#   end

#   def child_replies
#     data = QuestionsDatabase.instance.execute(<<-SQL, @id)
#       SELECT
#         *
#       FROM
#         replies
#       WHERE
#         parent_id = ?;
#     SQL

#     data.map { |datum| Reply.new(datum) }
#   end
  

# end


# class QuestionLike
#   attr_accessor :user_id, :question_id
  
#   def initialize(options)
#     @user_id = options['user_id']
#     @question_id = options['question_id']
#   end
# end