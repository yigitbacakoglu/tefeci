STATUS_CHOICES = {"paid"=>"Ödendi.", "not_paid"=>"Ödenmedi."}

class Credit < ActiveRecord::Base
  belongs_to :friend
  validates_inclusion_of :durum, :in => STATUS_CHOICES.keys
  validates_numericality_of :miktar, :presence => true, :message => '^Numerik bir değer giriniz.'

  def get_status
    STATUS_CHOICES[durum]
  end
end