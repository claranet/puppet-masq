require 'spec_helper'

describe 'masq', :type => :class do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts.merge({
            'kernel' => 'Linux',
          })
        end

        it { should compile.with_all_deps }
        it { should contain_class('masq::config') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'masq class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        'kernel' => 'SunOS'
      }}

      it { is_expected.to raise_error(Puppet::Error, %r{Sorry, SunOS is unsupported}) }
    end
  end
end
