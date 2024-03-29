# frozen_string_literal: true

require "rspec"
require "adt/hash_graph"

describe "HashGraph" do
  describe "#new" do
    it "creates an empty graph" do
      graph = ADT::HashGraph.new
      expect(graph.vertices).to be_empty
    end
  end

  describe "#add_node" do
    it "adds a node to the graph" do
      graph = ADT::HashGraph.new
      expect(graph.vertices).to be_empty

      graph.add_node(5)
      expect(graph.vertices.size).to eq(1)
      graph.add_node(1)
      expect(graph.vertices.size).to eq(2)
      graph.add_node(2)
      expect(graph.vertices.size).to eq(3)
    end

    it "adds a node containing an object to the graph" do
      graph = ADT::HashGraph.new
      expect(graph.vertices).to be_empty

      graph.add_node("key", [1, 2, 3])
      expect(graph.vertices.size).to eq(1)
      graph.add_node("key2", [4, 5, 6])
      expect(graph.vertices.size).to eq(2)
    end

    it "fails when inserting a node that already exists" do
      graph = ADT::HashGraph.new
      expect(graph.vertices).to be_empty

      graph.add_node(5)
      expect(graph.vertices.size).to eq(1)
      expect do
        graph.add_node(5)
      end.to raise_error do |error|
        expect(error).to be_a(ArgumentError)
        expect(error.message).to include("graph already has a node with key 5")
      end
    end
  end

  describe "#delete_node" do
    it "deletes a node from the graph" do
      graph = ADT::HashGraph.new
      expect(graph.vertices).to be_empty

      graph.add_node(5)
      graph.add_node(1)
      graph.add_node(2)
      expect(graph.vertices.size).to eq(3)

      graph.delete_node(5)
      graph.delete_node(1)
      graph.delete_node(2)
      expect(graph.vertices.size).to eq(0)
    end

    it "fails if node has incoming edges" do
      graph = ADT::HashGraph.new
      expect(graph.vertices).to be_empty

      graph.add_node(5)
      graph.add_node(1)
      graph.create_edge(5, 1)

      expect do
        graph.delete_node(1)
      end.to raise_error do |error|
        expect(error).to be_an(ArgumentError)
        expect(error.message).to include("can not delete node 1 because it has incoming edges")
      end
    end

    it "deletes outgoing edges and decreases degree of target nodes by one" do
      graph = ADT::HashGraph.new
      expect(graph.vertices).to be_empty

      graph.add_node(5)
      graph.add_node(1)
      graph.create_edge(5, 1)
      expect(graph.vertices[5].adjacent.size).to eq(1)
      expect(graph.vertices[5].adjacent).to contain_exactly(1)
      expect(graph.vertices[1].degree).to eq(1)

      graph.delete_node(5)
      expect(graph.vertices[5]).to be_nil
      expect(graph.vertices[1].degree).to be(0)
    end
  end

  describe "#create_edge" do
    def create_graph
      graph = ADT::HashGraph.new
      graph.add_node(5)
      graph.add_node(1)
      graph.add_node(2)
      graph
    end

    it "creates an edge if nodes exist" do
      graph = create_graph
      graph.create_edge(5, 2)
      expect(graph.vertices[5].adjacent).to contain_exactly(2)
      graph.create_edge(5, 1)
      expect(graph.vertices[5].adjacent).to contain_exactly(2, 1)
    end

    it "increases the degree of target nodes" do
      graph = create_graph
      expect(graph.vertices[5].degree).to eq(0)
      expect(graph.vertices[1].degree).to eq(0)
      expect(graph.vertices[2].degree).to eq(0)

      graph.create_edge(5, 2)
      expect(graph.vertices[5].degree).to eq(0)
      expect(graph.vertices[1].degree).to eq(0)
      expect(graph.vertices[2].degree).to eq(1)

      graph.create_edge(5, 1)
      expect(graph.vertices[5].degree).to eq(0)
      expect(graph.vertices[1].degree).to eq(1)
      expect(graph.vertices[2].degree).to eq(1)

      graph.create_edge(2, 1)
      expect(graph.vertices[5].degree).to eq(0)
      expect(graph.vertices[1].degree).to eq(2)
      expect(graph.vertices[2].degree).to eq(1)
    end

    it "fails if source node does not exist" do
      graph = create_graph
      expect do
        graph.create_edge(4, 2)
      end.to raise_error do |error|
        expect(error).to be_a(ArgumentError)
        expect(error.message).to include("graph does not have a node with key 4")
      end
    end

    it "fails if target node does not exist" do
      graph = create_graph
      expect do
        graph.create_edge(5, 3)
      end.to raise_error do |error|
        expect(error).to be_a(ArgumentError)
        expect(error.message).to include("graph does not have a node with key 3")
      end
    end
  end

  describe "#delete_edge" do
    def create_graph
      graph = ADT::HashGraph.new
      graph.add_node(5)
      graph.add_node(1)
      graph.add_node(2)
      graph.create_edge(5, 2)
      graph.create_edge(5, 1)
      graph
    end

    it "deletes an edge if it exists" do
      graph = create_graph
      expect(graph.vertices[5].adjacent.to_a).to match(array_including(1, 2))
      graph.delete_edge(5, 1)
      expect(graph.vertices[5].adjacent.to_a).not_to match(array_including(1, 2))
      expect(graph.vertices[5].adjacent.to_a).to match(array_including(2))
    end

    it "decreases the degree of the target node" do
      graph = create_graph
      expect(graph.vertices[1].degree).to eq(1)
      graph.delete_edge(5, 1)
      expect(graph.vertices[1].degree).to eq(0)
    end

    it "fails if source node does not exist" do
      graph = create_graph
      expect do
        graph.delete_edge(4, 2)
      end.to raise_error do |error|
        expect(error).to be_a(ArgumentError)
        expect(error.message).to include("graph does not have a node with key 4")
      end
    end

    it "fails if target node does not exist" do
      graph = create_graph
      expect do
        graph.delete_edge(5, 3)
      end.to raise_error do |error|
        expect(error).to be_a(ArgumentError)
        expect(error.message).to include("graph does not have a node with key 3")
      end
    end

    it "fails if edge does not exist" do
      graph = create_graph
      expect do
        graph.delete_edge(1, 5)
      end.to raise_error do |error|
        expect(error).to be_a(ArgumentError)
        expect(error.message).to include("edge does not exist")
      end
    end
  end
end
