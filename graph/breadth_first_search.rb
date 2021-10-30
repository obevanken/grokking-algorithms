# frozen_string_literal: true

module Graph
  # Поиск в ширину
  # @return [Array] путь
  class BreadthFirstSearch
    def initialize(graph, start_point, end_point)
      @graph = graph
      @start_point = start_point
      @end_point = end_point
      @queue = Queue.new
    end

    def execute
      already_checked = []
      parent = {}

      @queue << @start_point

      until @queue.empty? do
        point = @queue.pop

        next if already_checked.include?(point)

        return backtrace(parent) if point == @end_point

        @graph.fetch(point, []).each do |adjacent|
          parent[adjacent] = point
          @queue << adjacent
        end

        already_checked.push(point)
      end

      []
    end

    private

    def backtrace(parent)
      path = [@end_point]

      while path.last != @start_point do
        parent_key = parent[path.last]

        break unless parent_key

        path.push(parent_key)
      end

      path.reverse
    end
  end
end
