# frozen_string_literal: true

module Sort
  class ByChoice
    def initialize(array, action)
      @array = array
      @action = action
    end

    def execute
      validate!

      sorted_array = []

      @array.length.times do
        value, index = find_value_by_action

        next if value.nil?

        sorted_array.push(value)

        @array.delete_at index
      end

      sorted_array
    end

    private

    def validate!
      allowed_action = ["desc", "asc"]

      raise "Array is blank" if @array.nil? || @array.length <= 0

      raise "Action is blank" if @action.nil? || @action == ""

      raise "Action must be desc or asc" unless allowed_action.include?(@action.downcase)
    end

    def find_value_by_action
      case @action.downcase
      when "asc" then find_min
      when "desc" then find_max
      else [nil, nil]
      end
    end

    def find_min
      min_index = 0
      min_value = @array.first

      @array.each_with_index do |value, index|
        next if value > min_value

        min_value = value
        min_index = index
      end

      [min_value, min_index]
    end

    def find_max
      max_index = 0
      max_value = 0

      @array.each_with_index do |value, index|
        next if value < max_value

        max_value = value
        max_index = index
      end

      [max_value, max_index]
    end
  end
end
