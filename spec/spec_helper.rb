
shared_examples 'protocol component' do |parent|
  subject(:interface) { described_class.new }

  it { is_expected.to be_a parent }

  describe 'interface' do
    subject(:methods) { interface.methods }

    it { is_expected.to include(* (readable + writeable)) }
    it { is_expected.to include(* writeable.map { |a| (a.to_s + '=').to_sym }) }
  end
end
