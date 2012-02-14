geometries = []
materials = []

geometries << 'Cone'
geometries << 'Disc'
geometries << 'Sphere'
geometries << 'Point'

materials << 'Aluminum'
materials << 'Copper'
materials << 'Graphite'
materials << 'Stainless Steel'

setups = []

materials.each do |m1|
  geometries.each do |g1|
    materials.each do |m2|
      geometries.each do |g2|
        setups << m1+' '+g1+' PN '+m2+' '+g2
      end
    end
  end
end

return setups