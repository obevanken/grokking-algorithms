require "./algorithms/search"

RSpec.describe Algorithms::Search do
  context "#binary" do    
    let(:array_of_strings) { ["a", "b", "c", "d"] }
    let(:array_of_numbers) { [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }

    context "when the search will be in an array of numbers" do
      context "when search value exists" do
        let(:search_value) { 6 }
        let(:result_index) { 5 }

        it { expect(subject.binary(array_of_numbers, search_value)).to eq(result_index) }
      end

      context "when search value doesn't exist" do
        let(:search_value) { 11 }

        it { expect(subject.binary(array_of_numbers, search_value)).to be_nil }
      end
    end

    context "when the search will be in an array of numbers" do
      context "when search value exists" do
        let(:search_value) { "c" }
        let(:result_index) { 2 }

        it { expect(subject.binary(array_of_strings, search_value)).to eq(result_index) }
      end

      context "when search value doesn't exist" do
        let(:search_value) { "f" }

        it { expect(subject.binary(array_of_strings, search_value)).to be_nil }
      end
    end
  end
end