require "./sort/quick_sort"

RSpec.describe Sort::QuickSort do
  context "#execute" do
    subject { described_class.new(elements).execute }

    context "when count elements equals 2" do
      let(:elements) { [2, 1] }
      let(:sorted_elements) { [1, 2] }

      it { is_expected.to eq(sorted_elements) }
    end

    context "when count elements greater than 2" do
      let(:elements) { [2, 1, 4, 7, 5, 8, 6, 9, 10, 3] }
      let(:sorted_elements) { [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }

      it { is_expected.to eq(sorted_elements) }
    end

    context "when count elements greater than 2" do
      let(:elements) { [10, 5, 2, 3] }
      let(:sorted_elements) { [2, 3, 5, 10] }

      it { is_expected.to eq(sorted_elements) }
    end

    context "when elements are string" do
      let(:elements) { ["b", "a", "c"] }
      let(:sorted_elements) { ["a", "b", "c"] }

      it { is_expected.to eq(sorted_elements) }
    end

    context "when elemets contains equals elements" do
      let(:elements) { [10, 5, 2, 3, 2, 3] }
      let(:sorted_elements) { [2, 2, 3, 3, 5, 10] }

      it { is_expected.to eq(sorted_elements) }
    end
  end
end
