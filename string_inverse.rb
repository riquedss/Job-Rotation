class String
  def inverte
    new_string = String.new

    self.length.times do |character|
      new_string = self[character] + new_string
    end

    new_string
  end
end
