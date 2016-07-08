require 'spec_helper'

RSpec.describe Jaunt::CodeInspector do
  it 'intiailizes' do
    expect { Jaunt::CodeInspector.new }.to_not raise_exception
  end
end
