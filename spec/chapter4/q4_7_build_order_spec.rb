require 'rspec'
require 'chapter4/graphs'

context 'Graphs#build_order' do

  def build(projects, dependencies)
    graph = ADT::HashGraph.new
    projects.each do |project|
      graph.add_node(project)
    end
    dependencies.each do |dependency|
      graph.create_edge(dependency[0], dependency[1])
    end
    graph
  end

  def create_order_map(array)
    array.each_with_index.inject(Hash.new) do |map, pair|
      element, index = pair
      map[element] = index
      map
    end
  end

  example 'projects {a,b,c,d,e,f} with dependencies {(a,d),(f,b),(b,d),(f,a),(d,c)} should have a build order' do
    graph = build(%w{a b c d e f}, [%w(a d), %w(f b), %w(b d), %w(f a), %w(d c)])

    build_order = graph.build_order!

    expect(build_order.empty?).to eq(false)
    order_map = create_order_map(build_order)

    expect(order_map['e']).to be < order_map['a']
    expect(order_map['e']).to be < order_map['b']
    expect(order_map['e']).to be < order_map['c']
    expect(order_map['e']).to be < order_map['d']

    expect(order_map['f']).to be < order_map['a']
    expect(order_map['f']).to be < order_map['b']
    expect(order_map['f']).to be < order_map['c']
    expect(order_map['f']).to be < order_map['d']

    expect(order_map['a']).to be < order_map['d']
    expect(order_map['b']).to be < order_map['d']
    expect(order_map['a']).to be < order_map['c']
    expect(order_map['b']).to be < order_map['c']

    expect(order_map['d']).to be < order_map['c']
  end

  example 'projects {a,b,c,d,e,f} with dependencies {(a,d),(f,b),(b,d),(f,a),(d,c),(c,a)} should not have a build order' do
    graph = build(%w{a b c d e f}, [%w(a d), %w(f b), %w(b d), %w(f a), %w(d c), %w(c a)])

    build_order = graph.build_order!

    expect(build_order.empty?).to be(true)
  end

  example 'projects {a,b,c,d,e,f,g,h} with dependencies {(a e), (b a), (c a), (d g), (f c), (f b), (f a), (b h), (b e)} should have a build order' do
    graph = build(%w{a b c d e f g h}, [%w(a e), %w(b a), %w(c a), %w(d g), %w(f c), %w(f b), %w(f a), %w(b h), %w(b e)])

    build_order = graph.build_order!

    expect(build_order.empty?).to eq(false)
    order_map = create_order_map(build_order)

    expect(order_map['f']).to be < order_map['g']
    expect(order_map['f']).to be < order_map['c']
    expect(order_map['f']).to be < order_map['b']
    expect(order_map['f']).to be < order_map['a']
    expect(order_map['f']).to be < order_map['e']
    expect(order_map['f']).to be < order_map['h']

    expect(order_map['f']).to be < order_map['c']
    expect(order_map['f']).to be < order_map['b']
    expect(order_map['f']).to be < order_map['a']
    expect(order_map['f']).to be < order_map['e']
    expect(order_map['f']).to be < order_map['g']
    expect(order_map['f']).to be < order_map['h']

    expect(order_map['g']).to be < order_map['a']
    expect(order_map['g']).to be < order_map['e']
    expect(order_map['g']).to be < order_map['h']

    expect(order_map['c']).to be < order_map['a']
    expect(order_map['c']).to be < order_map['e']
    expect(order_map['c']).to be < order_map['h']

    expect(order_map['b']).to be < order_map['a']
    expect(order_map['b']).to be < order_map['e']
    expect(order_map['b']).to be < order_map['h']

    expect(order_map['a']).to be < order_map['e']
    expect(order_map['h']).to be < order_map['e']
  end

  example 'projects {a,b,c,d,e,f,g,h} with dependencies {(a e), (b a), (c a), (d g), (f c), (f b), (f a), (b h), (b e), (e d), (g f)} should not have a build order' do
    graph = build(%w{a b c d e f g h}, [%w(a e), %w(b a), %w(c a), %w(d g), %w(f c), %w(f b), %w(f a), %w(b h), %w(b e), %w(e d), %w(g f)])

    build_order = graph.build_order!

    expect(build_order.empty?).to be(true)
  end
end