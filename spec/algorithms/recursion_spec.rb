require "./algorithms/recursion"

RSpec.describe Algorithms::Recursion do
  context "#sum_of_numbers" do
    context "when array of numbers is small" do
      let(:array_of_numbers) { [1, 2, 3] }
      let(:result_sum) { 6 }

      it { expect(subject.sum_of_numbers(array_of_numbers)).to eq(result_sum) }
    end

    context "when array of numbers is big" do
      let(:array_of_numbers) { [1, 2, 3, 4, 5, 6, 7, 10, 15, 16] }
      let(:result_sum) { 69 }

      it { expect(subject.sum_of_numbers(array_of_numbers)).to eq(result_sum) }
    end
  end

  context "#count_of_elements" do
    context "when array of numbers is small" do
      let(:list_elements) { [1, 2, 3] }
      let(:length) { 3 }

      it { expect(subject.count_elements(list_elements)).to eq(length) }
    end

    context "when array of numbers is big" do
      let(:list_elements) { [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }
      let(:length) { 10 }

      it { expect(subject.count_elements(list_elements)).to eq(length) }
    end
  end

  context "#max_element" do
    context "when array of numbers is small" do
      let(:list_elements) { [1, 3, 2] }
      let(:max_value) { 3 }

      it { expect(subject.max_element(list_elements)).to eq(max_value) }
    end

    context "when array of numbers is big" do
        let(:list_elements) { [1, 3, 2, 4, 5, 8, 10, 10, 9] }
        let(:max_value) { 10 }
  
        it { expect(subject.max_element(list_elements)).to eq(max_value) }
      end
  end
end