# encoding: utf-8

module JSON
  module Generator
    describe AttributeFactory do
      describe '.create' do
        let(:attribute) { stub('attribute') }

        context 'when type is string' do
          let(:properties) { {'type' => 'string'} }

          it 'should create a StringAttribute' do
            StringAttribute.should_receive(:new).with(properties).and_return(attribute)
            described_class.create(properties).should == attribute
          end
        end

        context 'when type is object' do
          let(:properties) { {'type' => 'object'} }

          it 'should create an ObjectAttribute' do
            ObjectAttribute.should_receive(:new).with(properties).and_return(attribute)
            described_class.create(properties).should == attribute
          end
        end

        context 'when type is array' do
          let(:properties) { {'type' => 'array'} }

          it 'should create an ArrayAttribute' do
            ArrayAttribute.should_receive(:new).with(properties).and_return(attribute)
            described_class.create(properties).should == attribute
          end
        end

        context 'when type is integer' do
          let(:properties) { {'type' => 'integer'} }

          it 'should create an IntegerAttribute' do
            IntegerAttribute.should_receive(:new).with(properties).and_return(attribute)
            described_class.create(properties).should == attribute
          end
        end

        context 'when type is boolean' do
          let(:properties) { {'type' => 'boolean'} }

          it 'should create a BooleanAttribute' do
            BooleanAttribute.should_receive(:new).with(properties).and_return(attribute)
            described_class.create(properties).should == attribute
          end
        end

        context 'when type is number' do
          let(:properties) { {'type' => 'number'} }

          it 'should create a NumberAttribute' do
            NumberAttribute.should_receive(:new).with(properties).and_return(attribute)
            described_class.create(properties).should == attribute
          end
        end

        context 'when type is null' do
          let(:properties) { {'type' => 'null'} }

          it 'should create an EmptyAttribute' do
            EmptyAttribute.should_receive(:new).with(properties).and_return(attribute)
            described_class.create(properties).should == attribute
          end
        end

        context 'when type is any' do
          let(:properties) { {'type' => 'any'} }

          it 'should create an EmptyAttribute' do
            EmptyAttribute.should_receive(:new).with(properties).and_return(attribute)
            described_class.create(properties).should == attribute
          end
        end

        context 'when there is more than one type' do
          let(:properties) { {'type' => ['string', 'boolean']} }

          it 'should create an attribute for the first type' do
            StringAttribute.should_receive(:new).with(properties).and_return(attribute)
            described_class.create(properties).should == attribute
          end
        end

        context 'when there is no type' do
          let(:properties) { {} }

          it 'should create an EmptyAttribute' do
            EmptyAttribute.should_receive(:new).with(properties).and_return(attribute)
            described_class.create(properties).should == attribute
          end
        end
      end
    end
  end
end
