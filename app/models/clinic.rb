class Clinic < Profile

  def self.default
    Profile.where(role: "clinique").find_by_last_name("NC")
  end

  def self.duties_pool
    Profile.where(role: "clinique")
  end
end
