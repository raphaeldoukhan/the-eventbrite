class Event < ApplicationRecord
  belongs_to :admin, :foreign_key => :admin_id, class_name: 'User'
  has_many :attendances
  has_many :users, through: :attendances
  
  validates :start_date,
  presence: true,
  if: :already_past?
    
  validates :duration,
  presence: true,
  if: :validate_duration?
  
  validates :title,
  presence: true,
  length: { in: 5..140 }
  
  validates :description,
  presence: true,
  length: { in: 20..1000 }
  
  validates :price,
  presence: true,
  if: :validate_price?
  
  validates :location,
  presence: true

  private  
  
  def validate_price?
    if price.present?
      if price >= 1 && price <= 1000
        return true
      else
        errors.add(:price, " not good ! min 1 / max 1000")
      end
    end
  end

  def validate_duration?
    if duration.present?
      if duration > 0 && duration % 5 == 0 
        return true
      else 
        errors.add(:duration, " not valid please retry")
      end
    end
  end

  def already_past?
    if start_date < DateTime.now
      errors.add(:start_date, " already past")
    end 
  
  end

end