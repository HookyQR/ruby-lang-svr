# frozen_string_literal: true

require 'protocol/util/from_hash'

RSpec.describe LangSvr::Protocol::Util::FromHash do
  subject(:from_hash) { described_class.new(hash, klass) }
  let(:hash) { { constVal: 'first', val: 'second' } }
  let(:klass) do
    instance_double(Class,
                    constants: [:CONST_VAL],
                    const_get: 'first',
                    public_instance_methods: %i[val constVal],
                    new: true)
  end

  describe '.call' do
    subject(:result) { from_hash.call }

    context 'when matched' do
      it { is_expected.to be true }
    end

    context 'when constants un-matched' do
      let(:hash) { { constVal: 'not first', val: 'second' } }

      it { is_expected.to be_nil }
    end

    context 'when constant name un-matched' do
      let(:hash) { { notYourConst: 'first', val: 'second' } }

      it { is_expected.to be_nil }
    end

    context 'when value key not in class' do
      let(:hash) { { constVal: 'first', no_val: 'third' } }

      it { is_expected.to be_nil }
    end
  end
end
