# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  # WRITE THIS CODE
  sizes = [a, b, c].sort

  unless sizes.all?(&:positive?)
    raise TriangleError, 'No size can be 0 nor negative'
  end

  unless sizes[0] + sizes[1] > sizes[2]
    raise TriangleError, '2 smaller sides together must the > 3rd side'
  end

  case sizes.uniq.size
  when 1
    :equilateral
  when 2
    :isosceles
  else
    :scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
