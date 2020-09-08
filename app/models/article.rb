# frozen_string_literal: true

class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :generate_reference, use: :slugged

  has_many_attached :images
  has_many_attached :videos
  validate :images_presence, :images_type
  validate :videos_presence, :videos_type

  private

  def generate_reference
    GenerateReferenceService.new.call
  end

  def images_presence
    errors.add(:images, 'is missing') unless images.attached?
  end

  def images_type
    images.each do |image|
      next if ['image/jpeg', 'image/png', 'image/jpg'].include?(image.content_type)

      errors.add(:images, 'needs to be JPEG or PNG')
    end
  end

  def videos_presence
    errors.add(:videos, 'is missing') unless videos.attached?
  end

  def videos_type
    videos.each do |video|
      next if ['video/mov', 'video/mp4', 'video/avi', 'video/mpeg'].include?(video.content_type)

      errors.add(:videos, 'needs to be mp4')
    end
  end
end
