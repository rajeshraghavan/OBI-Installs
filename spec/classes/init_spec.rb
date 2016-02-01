require 'spec_helper'
describe 'cognosconf' do

  context 'with defaults for all parameters' do
    it { should contain_class('cognosconf') }
  end
end
