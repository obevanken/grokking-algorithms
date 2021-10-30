require "./graph/breadth_first_search"

module Tasks
  # Поиск короткого пути в графе
  class SearchShortWay
    def self.execute(graph, start_point, end_point)
      search = Graph::BreadthFirstSearch.new(graph, start_point, end_point)

      search.execute
    end
  end
end
