require 'rspec'
require 'adt/hash_graph'

describe 'HashGraph' do
  context '#new' do
    it 'creates an empty graph' do
      graph = ADT::HashGraph.new
      expect(graph.vertices).to be_empty
    end
  end

  context '#add_node' do
    it 'adds a node to the graph' do
      graph = ADT::HashGraph.new
      expect(graph.vertices).to be_empty

      graph.add_node(5)
      expect(graph.vertices.size).to eq(1)
      graph.add_node(1)
      expect(graph.vertices.size).to eq(2)
      graph.add_node(2)
      expect(graph.vertices.size).to eq(3)
    end

    it 'fails when inserting a node that already exists' do
      graph = ADT::HashGraph.new
      expect(graph.vertices).to be_empty

      graph.add_node(5)
      expect(graph.vertices.size).to eq(1)
      expect {
        graph.add_node(5)
      }.to raise_error do |error|
        expect(error).to be_a(ArgumentError)
      end
    end
  end

  context '#create_edge' do
    def create_graph
      graph = ADT::HashGraph.new
      graph.add_node(5)
      graph.add_node(1)
      graph.add_node(2)
      graph
    end

    it 'creates an edge if nodes exist' do
      graph = create_graph
      graph.create_edge(5, 2)
      expect(graph.vertices[5].adjacent).to contain_exactly(2)
      graph.create_edge(5, 1)
      expect(graph.vertices[5].adjacent).to contain_exactly(2, 1)
    end

    it 'fails if source node does not exist' do
      graph = create_graph
      expect {
        graph.create_edge(4, 2)
      }.to raise_error do |error|
        expect(error).to be_a(ArgumentError)
      end
    end

    it 'fails if target node does not exist' do
      graph = create_graph
      expect {
        graph.create_edge(5, 3)
      }.to raise_error do |error|
        expect(error).to be_a(ArgumentError)
      end
    end
  end
end