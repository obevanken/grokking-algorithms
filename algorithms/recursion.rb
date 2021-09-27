module Algorithms
  # Класс для рекурсивных решений
  class Recursion
    def sum_of_numbers(numbers)
      current_element = numbers.first

      return if numbers.length == 0

      return current_element if numbers.length == 1

      numbers.delete_at(0)

      current_element + sum_of_numbers(numbers)
    end

    def count_elements(list)
      index_first_element = 0

      return 0 if list[index_first_element].nil?
      
      list.delete_at(index_first_element)

      count_elements(list) + 1
    end

    def max_element(numbers)
      index_first_element = 0
      index_next_element = 1
      
      current_element = numbers[index_first_element]
      next_element = numbers[index_next_element]

      return current_element if next_element.nil?

      if current_element <= next_element
        numbers.delete_at(index_first_element)
      else
        numbers.delete_at(index_next_element)
      end

      max_element(numbers)
    end
  end
end