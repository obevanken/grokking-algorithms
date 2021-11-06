# frozen_string_literal: true

module Graph
  module Helpers
    def backtrace(parents, start_point, end_point)
      path = [end_point]

      while path.last != start_point do
        parent_key = parents[path.last]

        break unless parent_key

        path.push(parent_key)
      end

      path.reverse
    end
  end
end
