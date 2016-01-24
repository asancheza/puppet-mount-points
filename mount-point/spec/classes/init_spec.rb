require 'spec_helper'
describe 'point' do

  context 'with defaults for all parameters' do
    it { should contain_class('point') }
  end
end
