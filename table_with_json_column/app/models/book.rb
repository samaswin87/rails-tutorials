class Book < Article

  def author
    self.custom_fields['author']
  end 
  
  def pages
    self.custom_fields['pages']
  end

end
