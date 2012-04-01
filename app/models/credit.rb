STATUS_CHOICES = {"paid"=>"Odendi.", "not_paid"=>"Odenmedi."}

class Credit < ActiveRecord::Base
  belongs_to :friend
  validates_inclusion_of :durum, :in => STATUS_CHOICES.keys
  validates_numericality_of :miktar, :presence => true, :message => ': Numerik bir deger giriniz.'

  def get_status
    STATUS_CHOICES[durum]
  end
end