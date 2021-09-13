module Algorithms
  class Sort
    # Сортировка выбором
    # @params [Array] array - массив для сортировки
    # @params [String] action - действие, либо asc, либо desc
    def by_choice(array, action)
      sorted_array = []

      validate_sort_by_choice array, action

      array.length.times do
        case action.downcase
        when "asc"
          min_value, index_for_value = find_min array

          sorted_array.push min_value
        when "desc"
          max_value, index_for_value = find_max array

          sorted_array.push max_value
        else
          next
        end

        array.delete_at index_for_value
      end

      sorted_array
    end

    private

    def find_min(array)
      min_index = 0
      min_value = array.first

      array.each_with_index do |value, index|
        next if value > min_value

        min_value = value
        min_index = index
      end

      [min_value, min_index]
    end

    def find_max(array)
      max_index = 0
      max_value = 0

      array.each_with_index do |value, index|
        next if value < max_value

        max_value = value
        max_index = index
      end

      [max_value, max_index]
    end

    def validate_sort_by_choice(array, action)
      allowed_action = ["desc", "asc"]

      raise "Array is blank" if array.nil? || array.length <= 0 

      raise "Action is blank"if action.nil? || action == ""

      raise "Action must be desc or asc" unless allowed_action.include?(action.downcase)
    end
  end
end
