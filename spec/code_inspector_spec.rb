require 'spec_helper'

RSpec.describe Jaunt::CodeInspector do
  let(:example_file) do
    Jaunt::ROOT + 'spec/support/example_jaunt.rb'
  end
  let(:inspector) { Jaunt::CodeInspector.new(example_file) }

  describe '#stops' do
    it 'searches the example file for Jaunt markers' do
      expect(inspector.stops.count).to eq(3)
    end

    it 'orders the stops based on how interesting it is' do
      expect(inspector.stops.last.text).to match(/:jaunt-3:/)
    end

    it 'returns the relevant code snippet for a stop' do
      last_stop = inspector.stops.last
      expect(last_stop.code_text).to eq("  def least_interesting\n  end\n")
    end

    it 'displays only the source code associated with the snippet' do
      first_stop = inspector.stops.first
      expect(first_stop.code_text).to eq('class ExampleJaunt')
    end

    it 'limits the code snippet to 25 lines'
  end

  describe '#sort_stops' do
    it 'orders :jaunt-1: before :jaunt-2:' do
      left = double(text: ':jaunt-2:')
      right = double(text: ':jaunt-1:')
      expect(inspector.sort_stops(left, right)).to eq(1)
    end
  end
end
