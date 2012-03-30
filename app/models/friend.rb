# -*- coding:utf-8 -*-
class Friend < ActiveRecord::Base
  belongs_to  :user
  has_many  :debits
  accepts_nested_attributes_for :debits
  validates_presence_of :name, :message => '^İsim alanı gereklidir.'
  validates_presence_of :email, :message => '^Email alanı gereklidir.'
  validates_format_of     :email,
                          :with       => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                          :message    => '^Geçerli bir email giriniz.'

  def total_not_paid
      Debit.sum(:amount, :group=>:friend_id, :conditions=>["status='not_paid'"])[id] or 0
  end

  def total_paid
      Debit.sum(:amount, :group=>:friend_id, :conditions=>["status='paid'"])[id] or 0
  end

  def total_debit
    self.debits.sum(:amount) or 0
  end

  def to_s
    self.name
  end
end