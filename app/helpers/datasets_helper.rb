module DatasetsHelper

  # d is a Dataset 
  def style d
    str = 'style="'
    str << 'text-decoration:line-through;' if d.status == 3
    str << 'font-style:italic;' if d.status == 2
    str << '"'
    str.html_safe
  end

  def options_materials
    str = '<option>????</option>'
    str << '<option>Aluminum</option>'
    str << '<option>Copper</option>'
    str << '<option>Graphite</option>'
    str << '<option>Stainless Steel</option>'
    str
  end

  def options_geometries
    str = '<option>????</option>'
    str << '<option>Cone</option>'
    str << '<option>Disc</option>'
    str << '<option>Sphere</option>'
    str << '<option>Point</option>'
    str
  end

end
