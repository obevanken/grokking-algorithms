require "./search/binary"

RSpec.describe Search::Binary do
  context "#execute" do
    subject { described_class.new(array, search_value).execute }

    context "when the search will be in an array of numbers" do
      let(:array) { [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }

      context "when search value exists" do
        let(:search_value) { 6 }
        let(:result_index) { 5 }

        it { is_expected.to eq(result_index) }
      end

      context "when search value doesn't exist" do
        let(:search_value) { 11 }

        it { is_expected.to be_nil }
      end
    end

    context "when the search will be in an array of strings" do
      let(:array) { ["a", "b", "c", "d"] }

      context "when search value exists" do
        let(:search_value) { "c" }
        let(:result_index) { 2 }

        it { is_expected.to eq(result_index) }
      end

      context "when search value doesn't exist" do
        let(:search_value) { "f" }

        it { is_expected.to be_nil }
      end
    end
  end
end