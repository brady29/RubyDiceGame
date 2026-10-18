# The Drop Dead scoring rules.
class RollEvaluator
  DEAD_FACES = [2, 5].freeze

  def dead_face?(face)
    DEAD_FACES.include?(face)
  end

  def contains_dead_face?(faces)
    faces.any? { |face| dead_face?(face) }
  end

  # Sum of the faces, or 0 if any face is a 2 or 5.
  def score(faces)
    contains_dead_face?(faces) ? 0 : faces.sum
  end
end
