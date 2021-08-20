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
    end
  end
end
