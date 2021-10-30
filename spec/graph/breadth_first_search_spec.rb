require "./graph/breadth_first_search"

RSpec.describe Graph::BreadthFirstSearch do
  context "#execute" do
    subject { described_class.new(graph, start_point, end_point).execute }

    let(:graph) do
      {
        a: [:b, :c],
        b: [:c, :a],
        c: []
      }
    end

    context "when result was found" do
      let(:start_point) { :b }
      let(:end_point) { :c }
      let(:will_result) { [:b, :c] }

      it { is_expected.to eq(will_result) }
    end

    context "when result not found" do
      let(:start_point) { :b }
      let(:end_point) { :f }
      let(:will_result) { [] }

      it { is_expected.to eq(will_result) }
    end
  end
end