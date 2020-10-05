require 'rspec'
require 'chapter4/graphs'

describe 'HashGraph#route?' do
  context 'small graph' do
    def create_graph
      graph = ADT::HashGraph.new
      graph.add_node(0)
      graph.add_node(1)
      graph.add_node(2)
      graph.add_node(3)
      graph.add_node(4)
      graph.create_edge(3, 2)
      graph.create_edge(2, 0)
      graph.create_edge(0, 1)
      graph.create_edge(1, 2)
      graph.create_edge(4, 4)
      graph
    end

    example 'there should be a route from 3 to 2' do
      graph = create_graph
      expect(graph.route?(3, 2)).to be_truthy
    end

    example 'there should be a route from 2 to 0' do
      graph = create_graph
      expect(graph.route?(2, 0)).to be_truthy
    end

    example 'there should be a route from 0 to 1' do
      graph = create_graph
      expect(graph.route?(0, 1)).to be_truthy
    end

    example 'there should be a route from 0 to 1' do
      graph = create_graph
      expect(graph.route?(0, 2)).to be_truthy
    end

    example 'there should be a route from 1 to 2' do
      graph = create_graph
      expect(graph.route?(1, 2)).to be_truthy
    end

    example 'there should be a route from 1 to 0' do
      graph = create_graph
      expect(graph.route?(1, 0)).to be_truthy
    end

    example 'there should be a route from 3 to 0' do
      graph = create_graph
      expect(graph.route?(3, 0)).to be_truthy
    end

    example 'there should be a route from 3 to 1' do
      graph = create_graph
      expect(graph.route?(3, 1)).to be_truthy
    end

    example 'there should be a route from 2 to 1' do
      graph = create_graph
      expect(graph.route?(2, 1)).to be_truthy
    end

    example 'there should be a route from 0 to 0' do
      graph = create_graph
      expect(graph.route?(0, 0)).to be_truthy
    end

    example 'there should be a route from 1 to 1' do
      graph = create_graph
      expect(graph.route?(1, 1)).to be_truthy
    end

    example 'there should be a route from 2 to 2' do
      graph = create_graph
      expect(graph.route?(1, 1)).to be_truthy
    end

    example 'there should be a route from 4 to 4' do
      graph = create_graph
      expect(graph.route?(4, 4)).to be_truthy
    end

    example 'there should not be a route from 0 to 3' do
      graph = create_graph
      expect(graph.route?(0, 3)).to be_falsey
    end

    example 'there should not be a route from 1 to 3' do
      graph = create_graph
      expect(graph.route?(1, 3)).to be_falsey
    end

    example 'there should not be a route from 2 to 3' do
      graph = create_graph
      expect(graph.route?(2, 3)).to be_falsey
    end

    example 'there should not be a route from 3 to 3' do
      graph = create_graph
      expect(graph.route?(3, 3)).to be_falsey
    end

    example 'there should not be a route from 0 to 4' do
      graph = create_graph
      expect(graph.route?(0, 4)).to be_falsey
    end

    example 'there should not be a route from 1 to 4' do
      graph = create_graph
      expect(graph.route?(1, 4)).to be_falsey
    end

    example 'there should not be a route from 2 to 4' do
      graph = create_graph
      expect(graph.route?(2, 4)).to be_falsey
    end

    example 'there should not be a route from 3 to 4' do
      graph = create_graph
      expect(graph.route?(3, 4)).to be_falsey
    end

    example 'there should not be a route from 4 to 0' do
      graph = create_graph
      expect(graph.route?(4, 0)).to be_falsey
    end

    example 'there should not be a route from 4 to 1' do
      graph = create_graph
      expect(graph.route?(4, 1)).to be_falsey
    end

    example 'there should not be a route from 4 to 2' do
      graph = create_graph
      expect(graph.route?(4, 2)).to be_falsey
    end

    example 'there should not be a route from 4 to 3' do
      graph = create_graph
      expect(graph.route?(4, 3)).to be_falsey
    end
  end
end

