# frozen_string_literal: true

module Sort
  class QuickSort
    def initialize(array)
      @start_array = array
    end

    def execute(array = @start_array)
      return array if array.length < 2

      median = array.length / 2

      support_element = array[median]

      array.delete_at(median)

      less_elements = array.select { |element| less_or_equal?(element, support_element) }

      greater_elements = array.select { |element| greater?(element, support_element) }

      execute(less_elements) + [support_element] + execute(greater_elements)
    end

    private

    def less_or_equal?(target_value, value)
      less?(target_value, value) || equal?(target_value, value)
    end

    def greater?(target_value, value)
      return true if (target_value <=> value) == 1

      false
    end

    def less?(target_value, value)
      return true if (target_value <=> value) == -1

      false
    end

    def equal?(target_value, value)
      return true if (target_value <=> value).zero?

      false
    end
  end
end
