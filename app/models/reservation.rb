class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  def self.reservations_after_three_month
    service = BaseService.new
    service.reservations_after_three_month
  end

  def self.check_reservation_day(day)
    if day < Date.current
      return "過去の日付は選択できません。正しい日付を選択してください。"
    elsif day < (Date.current + 1.day)
      return "当日は選択できません。正しい日付を選択してください。"
    elsif (Date.current >> 3) < day
      return "3ヶ月以降の日付は選択できません。正しい日付を選択してください。"
    end
  end
end
