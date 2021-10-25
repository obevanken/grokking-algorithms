# frozen_string_literal: true

module Search
  # Бинарный поиск
  class Binary
    def initialize(sorted_array, search_value)
      @sorted_array = sorted_array
      @search_value = search_value
    end

    def execute
      left_border = 0
      right_border = @sorted_array.length

      while left_border <= right_border do
        median = (left_border + right_border) / 2
        guess_value = @sorted_array[median]

        case guess_value <=> @search_value
        when -1 then right_border = median - 1
        when 1 then left_border = median + 1
        else
          return median
        end
      end

      nil
    end
  end
end
