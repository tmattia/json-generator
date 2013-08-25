# encoding: utf-8

module JSON
  module Generator
    describe IntegerAttribute do
      it 'should be a BasicAttribute' do
        described_class.new(nil).should be_kind_of(BasicAttribute)
      end

      describe '#generate' do
        context 'without a default value' do
          it 'should return 0' do
            described_class.new({'type' => 'integer'}).generate.should == 0
          end
        end
      end
    end
  end
end
