class Quote < ApplicationRecord
  belongs_to :company
  has_many :line_item_dates, dependent: :destroy
  
  validates :name, presence: true
  scope :ordered, -> { order(id: :desc) }
  # traditional way
  # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: {quote: self }} 
  #convention way
  # after_create_commit -> { broadcast_prepend_to "quotes"} 
  # after_update_commit -> { broadcast_replace_to "quotes"} 
  # after_destroy_commit -> { broadcast_remove_to "quotes"} 
  # fantastic rails, those three method can be simplified by this code 
  broadcasts_to -> (quote) { [quote.company, "quotes"] }, inserts_by: :prepend

  
end
