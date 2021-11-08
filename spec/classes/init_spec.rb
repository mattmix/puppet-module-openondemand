require 'spec_helper'

describe 'openondemand' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }

      it { is_expected.to create_class('openondemand') }

      if facts[:os]['family'] == 'RedHat'
        include_context 'openondemand::repo::rpm', facts
      elsif facts[:os]['family'] == 'Debian'
        include_context 'openondemand::repo::apt', facts
      end
      include_context 'openondemand::apache', facts
      include_context 'openondemand::config', facts

      it { is_expected.to contain_package('ondemand').that_comes_before('Class[sudo]') }
    end # end context
  end # end on_supported_os loop
end # end describe
