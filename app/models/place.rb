class Place < ActiveRecord::Base
  belongs_to :user
  has_many :events, :dependent => :destroy
  
  attr_accessible :adress, :description, :name, :phone, :user_id
  

  validates_presence_of :name, :adress
  validates_uniqueness_of :name, :adress, :description
  before_validation :clean_name, if: "name.present?"
  before_validation :clean_adress, if: "adress.present?" 

  private
  def clean_name
    self.name = self.name.strip.capitalize
  end
  def clean_adress
    self.adress = self.adress.strip.capitalize
  end

  
  
end

