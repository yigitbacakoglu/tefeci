# -*- coding:utf-8 -*-
class Friend < ActiveRecord::Base
  belongs_to  :user
  has_many  :credits
  accepts_nested_attributes_for :credits
  validates_presence_of :name, :message => ':isim alani gereklidir.'
  validates_presence_of :email, :message => ':email alani  gereklidir.'
  validates_format_of     :email,
                          :with       => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                          :message    => ':Gecerli bir email giriniz (tefeci@example.com)'

  

  def to_s
    self.name
  end

end