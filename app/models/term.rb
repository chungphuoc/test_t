class Term < ActiveRecord::Base
  enum user_type: [:customer, :studio]

  validates :content, presence: true
  validates :user_type, inclusion: { in: user_types.keys }, uniqueness: true

  def self.create_default
    Term.create!(content: 'customer', user_type: Term.user_types[:customer])
    Term.create!(content: 'studio', user_type: Term.user_types[:studio])
  end

  def self.customer_term_condition
    Term.find_by(user_type: Term.user_types[:customer])
  end

  def self.studio_term_condition
    Term.find_by(user_type: Term.user_types[:studio])
  end
end
