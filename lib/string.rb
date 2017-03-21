# added new sanitization method for our cvs string
class String
  def split_and_sanitize_to_a
    split(',').collect{|item| item.strip }
  end
end
