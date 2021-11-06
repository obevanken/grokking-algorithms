# frozen_string_literal: true

require_relative "./helpers"

module Graph
  # Поиск в ширину
  # @return [Array] путь
  class BreadthFirstSearch
    include Helpers

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

        return backtrace(parent, @start_point, @end_point) if point == @end_point

        @graph.fetch(point, []).each do |adjacent|
          parent[adjacent] = point
          @queue << adjacent
        end

        already_checked.push(point)
      end

      []
    end
  end
end
