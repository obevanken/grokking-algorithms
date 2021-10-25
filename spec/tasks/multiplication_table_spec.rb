require "./tasks/multiplication_table"

RSpec.describe Tasks::MultiplicationTable do
  subject { described_class.execute(elements) }
  
  context "when array of elements contains only numbers" do
    let(:elements) { [2, 3, 7, 8, 10] }
    let(:result) { 
      [
        [4, 6, 14, 16, 20],
        [6, 9, 21, 24, 30],
        [14, 21, 49, 56, 70],
        [16, 24, 56, 64, 80],
        [20, 30, 70, 80, 100]
      ]
    }

    it { is_expected.to eq(result) }
  end
end