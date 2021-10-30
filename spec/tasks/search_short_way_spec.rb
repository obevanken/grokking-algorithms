require "./tasks/search_short_way"

RSpec.describe Tasks::SearchShortWay do
  subject { described_class.execute(graph, start_point, end_point)[1..-2].length }

  context "task 1" do
    let(:graph) do
      {
        a: [:b, :c],
        b: [:d, :e],
        c: [:d, :f],
        d: [],
        e: [:f],
        f: []
      }
    end

    let(:end_point) { :f }
    let(:start_point) { :a }

    it { is_expected.to eq(2) }
  end

  context "task 2" do
    let(:graph) do
      {
        cab: [:car, :cat],
        cat: [:bat, :mat],
        car: [:cat, :bar],
        bar: [:bat],
        mat: [:bat],
        bat: []
      }
    end

    let(:end_point) { :bat }
    let(:start_point) { :cab }

    it { is_expected.to eq(2) }
  end
end