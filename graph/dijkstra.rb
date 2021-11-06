# frozen_string_literal: true

require_relative "./helpers"

module Graph
  # Алгоритм дейкстры
  # @param[Hash] graph - взвешанный граф
  # @param[Hash] parents - родители вершин
  # @param[Hash] costs - стоимости вершин
  # @param[Symbol] start_point - начало
  # @param[Symbol] end_point - конец 
  # @return [Array] короткий путь
  class Dijkstra
    include Helpers

    def initialize(graph, parents, costs, start_point, end_point)
      @graph = graph
      @parents = parents
      @costs = costs
      @start_point = start_point
      @end_point = end_point
      @processed = []
    end

    def execute
      node = find_lowest_cost_node(@costs)

      until node.nil?
        cost = @costs[node]
        neighbors = @graph[node]

        neighbors.each_key do |neighbor|
          new_cost = cost + neighbors[neighbor]

          if @costs[neighbor] > new_cost
            @costs[neighbor] = new_cost
            @parents[neighbor] = node
          end
        end

        @processed.push(node)
        node = find_lowest_cost_node(@costs)
      end

      [@costs[@end_point], backtrace(@parents, @start_point, @end_point)]
    end

    private

    def find_lowest_cost_node(costs)
      lowest_cost = Float::INFINITY
      lowest_cost_node = nil

      costs.each_key do |node|
        cost = costs[node]

        if cost < lowest_cost && !@processed.include?(node)
          lowest_cost = cost
          lowest_cost_node = node
        end
      end

      lowest_cost_node
    end
  end
end
