# frozen_string_literal: true

require 'spec_helper'

describe 'puppet_apache' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to contain_class('puppet_apache::install') }
      it { is_expected.to contain_class('puppet_apache::config') }
      it { is_expected.to contain_class('puppet_apache::service') }
      it { is_expected.to compile }

      case os_facts[:osfamily]
      when 'Debian'
        it { is_expected.to contain_package('apache2').with_ensure('present') }
        it { is_expected.to contain_file('/etc/apache2/apache2.conf').with_source('puppet:///modules/puppet_apache/Debian.conf') }
        it { is_expected.to contain_service('apache2').with(ensure: 'running', enable: true, hasrestart: true) }
      when 'RedHat'
        it { is_expected.to contain_package('httpd').with_ensure('present') }
        it { is_expected.to contain_file('/etc/httpd/conf/httpd.conf').with_source('puppet:///modules/puppet_apache/RedHat.conf') }
        it { is_expected.to contain_service('httpd').with(ensure: 'running', enable: true, hasrestart: true) }
      end
    end
  end
end
