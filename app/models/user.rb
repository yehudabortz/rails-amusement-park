class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true

    has_many :rides
    has_many :attractions , through: :rides

    def mood
        unless happiness.nil? || nausea.nil?
            happiness > nausea ? "happy" : "sad"
        end
    end
end
