require 'spec_helper'

describe 'openondemand' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }

      it { is_expected.to create_class('openondemand') }

      include_context 'openondemand::repo', facts
      include_context 'openondemand::apache', facts
    end # end context
  end # end on_supported_os loop
end # end describe
