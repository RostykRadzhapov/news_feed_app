# frozen_string_literal: true

class GenerateReferenceService
  def initialize; end

  def call
    "#{rand_string}-#{rand_numbers}-#{rand_string}-#{rand_numbers}-#{rand_string}"
  end

  private

  def rand_string
    ('A'..'Z').to_a.sample(3).join
  end

  def rand_numbers
    rand(100..999)
  end
end
