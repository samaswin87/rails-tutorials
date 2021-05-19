class Book < Article

  def author
    self.custom_fields ||= {}
    self.custom_fields['author']
  end 
  
  def pages
    self.custom_fields ||= {}
    self.custom_fields['pages']
  end

  def author=(value)
    self.custom_fields ||= {}
    self.custom_fields['author'] = value
  end 
  
  def pages=(value)
    self.custom_fields ||= {}
    self.custom_fields['pages'] = value
  end

end
