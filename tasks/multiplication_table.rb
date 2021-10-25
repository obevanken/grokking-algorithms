module Tasks
  # Создать таблицу умножения для всех элементов массива. Например
  # Если массив состоит из элементов [2, 3, 7, 8, 10], то сначала каждый элемент
  # умножается на 2, затем каждый элемент умножается на 3 и т.д

  class MultiplicationTable
    def self.execute(array)
      return multiplication_by_elements(array)
    end

    def self.multiplication_by_elements(array_will_multiplicate, result = [], prev_index = 0)
      return result if array_will_multiplicate.length == 0

      multiplicated_row = []

      multiplication_element = array_will_multiplicate[0]

      result.each_index do |key|
        break if prev_index == 0

        multiplicated_row.push(result[key][prev_index])
      end

      array_will_multiplicate.each { |element| multiplicated_row.push(element * multiplication_element) }

      result.push(multiplicated_row)

      array_will_multiplicate.delete_at(0)

      return multiplication_by_elements(array_will_multiplicate, result, prev_index + 1)
    end
  end
end
