require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  queue = []
  vertices.each do |vertice|
    if vertice.in_edges.empty?
    queue << vertice
    end
  end
  until queue.empty?
    current_v = queue.pop
    sorted << current_v
    current_v.out_edges.each do |out_edge|
      if out_edge.to_vertex.in_edges.empty?
        queue << out_edge.to_vertex
      end
      out_edge.destroy!
    end
  end
  p sorted
  sorted
end
