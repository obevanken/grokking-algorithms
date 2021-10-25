require "./sort/by_choice"

RSpec.describe Sort::ByChoice do
  context "#execute" do
    subject { described_class.new(array, action).execute }

    let(:array) { [5, 6, 1, 3, 2, 4] }
    let(:action) { "asc" }

    context "when the sort will be in an array of numbers" do
      context "when the sort by asc action" do
        let(:should_result) { [1, 2, 3, 4, 5, 6] }

        it { is_expected.to eq(should_result) }
      end

      context "when the sort by desc action" do
        let(:action) { "desc" }
        let(:should_result) { [6, 5, 4, 3, 2, 1] }

        it { is_expected.to eq(should_result) }
      end
    end

    context "when data is invalid" do
      subject { -> { described_class.new(array, action).execute } }

      context "when array is blank" do
        let(:array) { [] }

        it { is_expected.to raise_error(RuntimeError, "Array is blank") }
      end

      context "when array is nil" do
        let(:array) { nil }

        it { is_expected.to raise_error(RuntimeError, "Array is blank") }
      end

      context "when action is nil" do
        let(:action) { nil }

        it { is_expected.to raise_error(RuntimeError, "Action is blank") }
      end

      context "when action is empty string" do
        let(:action) { "" }

        it { is_expected.to raise_error(RuntimeError, "Action is blank") }
      end

      context "when action is not eq desc or asc" do
        let(:action) { "invalid_action" }

        it { is_expected.to raise_error(RuntimeError, "Action must be desc or asc") }
      end
    end
  end
end