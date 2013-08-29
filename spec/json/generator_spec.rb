# encoding: utf-8

module JSON
  describe Generator do
    describe '.generate' do
      let(:attribute) { double('attribute') }
      let(:schema) { double('schema') }
      let(:dereferenced_schema) { double('dereferenced schema') }
      let(:generated_json) do
        {
          :a => 'b',
          :c => {
            :d => 'e'
          }
        }
      end

      it 'should dereference a given schema and generate valid JSON for it' do
        JSON::Generator::Dereferencer.should_receive(:dereference).
          with(schema).
          and_return(dereferenced_schema)
        Generator::AttributeFactory.should_receive(:create).with(dereferenced_schema).and_return(attribute)
        attribute.should_receive(:generate).and_return(generated_json)

        described_class.generate(schema).should == generated_json
      end

      it 'should perform a hash-deep-merge' do
        JSON::Generator::Dereferencer.should_receive(:dereference).
          with(schema).
          and_return(dereferenced_schema)
        Generator::AttributeFactory.should_receive(:create).with(dereferenced_schema).and_return(attribute)
        attribute.should_receive(:generate).and_return(generated_json)
        merge_json = {:merge => 'test'}
        expected_json = generated_json.deep_merge(merge_json)

        described_class.generate(schema, merge_json).should == expected_json
      end
    end
  end
end
