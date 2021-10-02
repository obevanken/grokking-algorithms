require "./algorithms/sort"

RSpec.describe Algorithms::Sort do
  context "#by_choice" do
    let(:array_of_numbers) { [5, 6, 1, 3, 2, 4] }
    let(:action) { "asc" }

    context "when the sort will be in an array of numbers" do
      context "when the sort by asc action" do
        let(:should_result) { [1, 2, 3, 4, 5, 6] }

        it { expect(subject.by_choice(array_of_numbers, action)).to eq(should_result) }
      end

      context "when the sort by desc action" do
        let(:action) { "desc" }
        let(:should_result) { [6, 5, 4, 3, 2, 1] }

        it { expect(subject.by_choice(array_of_numbers, action)).to eq(should_result) }
      end
    end

    context "when data is invalid" do
      context "when array is blank" do
        let(:blank_array) { [] }
        let(:nil_array) { nil }

        it { expect { subject.by_choice(blank_array, action) }.to raise_error(RuntimeError, "Array is blank") }
        it { expect { subject.by_choice(blank_array, action) }.to raise_error(RuntimeError, "Array is blank") }

      end

      context "when action is blank" do
        let(:blank_action) { "" }
        let(:nil_action) { nil }

        it { expect { subject.by_choice(array_of_numbers, blank_action) }.to raise_error(RuntimeError, "Action is blank") }
        it { expect { subject.by_choice(array_of_numbers, nil_action) }.to raise_error(RuntimeError, "Action is blank") }
      end

      context "when action is not eq desc or asc" do
        let(:invalid_action) { "invalid_action" }

        it "returns error" do
          expect { subject.by_choice(array_of_numbers, invalid_action) }.to \
            raise_error(RuntimeError, "Action must be desc or asc")
        end
      end
    end

    context "#quick_sort" do
      subject { Algorithms::Sort.new.quick_sort(elements) }

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
end