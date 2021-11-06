require "./graph/dijkstra"

RSpec.describe Graph::Dijkstra do
  context "#execute" do
    subject { described_class.new(graph, parents, costs, start_point, end_point).execute }

    context "task 1" do
      let(:graph) do
        {
          start: {
            a: 6,
            b: 2
          },
          a: {
            final: 1
          },
          b: {
            a: 3,
            final: 5
          },
          final: {}
        }
      end

      let(:costs) do
        {
          a: 6,
          b: 2,
          final: Float::INFINITY
        }
      end

      let(:parents) do
        {
          a: :start,
          b: :start,
          final: nil
        }
      end

      let(:start_point) { :start }
      let(:end_point) { :final }
      let(:will_shortest_way) { [:start, :b, :a, :final] }
      let(:will_result) { [6, will_shortest_way] }

      it { is_expected.to eq(will_result) }
    end
  end
end