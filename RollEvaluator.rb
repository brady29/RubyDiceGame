# Applies the Drop Dead scoring rules to a single roll.
class RollEvaluator
  DEAD_FACES = [2, 5].freeze

  # True when the face is one that kills a die (a 2 or a 5).
  def dead_face?(face)
    DEAD_FACES.include?(face)
  end

  # True when at least one face in the roll is a 2 or a 5.
  def contains_dead_face?(faces)
    faces.any? { |face| dead_face?(face) }
  end

  # Points earned by the roll: the sum of the faces, or 0 when any face is a 2 or a 5.
  def score(faces)
    contains_dead_face?(faces) ? 0 : faces.sum
  end
end
