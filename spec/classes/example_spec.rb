require 'spec_helper'

describe 'masq' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "masq class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('masq::params') }

        it { should contain_class('masq::install').that_comes_before('masq::config') }
        it { should contain_class('masq::config') }
        it { should contain_class('masq::service').that_subscribes_to('masq::config') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'masq class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
