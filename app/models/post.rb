class Post < ActiveRecord::Base
    validates :title, presence: true 
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

    BAIT = [/Won't Believe/i, /Secrete/i, /Top [0-9]*/i, /Guess/i]
    validate :bait?

    def bait?
        if !BAIT.find{|b| b.match title}
            errors.add(:title, "add click-bait to title")
        end
    end
end
